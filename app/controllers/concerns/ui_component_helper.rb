module UiComponentHelper

  #### Base HTML Component Helpers

  HEADERS = %w( h1 h2 h3 h4 h5 h6 )
  TEXT = %w( a p span )
  TABLE = %w( table thead tr td tbody th )
  BLOCK = %w( div )
  LIST = %w( ul ol dl li )
  CODE = %w( code pre section kbd var samp )
  FIGURE = %w( figure figcaption )
  MISC = %w( attr button img progress )
  NAV = %w( nav )
  ALL_SELF_CONTAINED_ELEMENTS = [HEADERS, TEXT, BLOCK, CODE, MISC, FIGURE].flatten.freeze
  ALL_ELEMENTS = [ALL_SELF_CONTAINED_ELEMENTS, LIST, TABLE, NAV].flatten.freeze

  ALL_ELEMENTS.each do |element|

    define_method element do |*args, &block|
      options = args.first
      options[:class] = options[:class].try(:strip) if options

      content_tag element, options do
        block.call if block
      end
    end

  end

  #### Custom Component Helpers

  def component(element_bind, component, *args, &block)
    element_params = args.first || {}

    # Default Class
    element_params[:class] ||= ""
    element_params[:class] << " #{component["default_class"]}" if component["default_class"]

    # Default HTML, such as type
    if component["default_html"].present?
      component["default_html"].each do |key, value|
        element_params[key] = check_params_for_value(element_params, key) || value
      end
    end

    # Default Classes, such as type
    if component["class_sets"].present?
      component["class_sets"].each do |key, values|
        values["classes"].each do |class_type|
          # Check if we want to use the class
          if check_params_for_value(element_params, class_type)
            class_modifier = [values["prefix"], class_type] # Prefix and class, check for any suffixes
            class_modifier << values["suffix"]["modifier"] if values["suffix"] && check_params_for_value(element_params, values["suffix"]["condition"])
            element_params[:class] << " #{class_modifier.reject(&:blank?).join("-")}"
          end
        end
      end
    end

    # Check for conditional_classes, like "fade in" applied if "fade_in"
    if component["conditional_classes"].present?
      component["conditional_classes"].each do |conditional_class|
        element_params[:class] << " #{conditional_class["class"]}" if check_params_for_value(element_params, conditional_class["condition"])
      end
    end

    # Check for shortcuts, like label for aria-label
    if component["shortcuts"].present?
      component["shortcuts"].each do |shortcut, actual_value|
        shortcut_value = check_params_for_value(element_params, shortcut)
        element_params[actual_value] = shortcut_value unless shortcut_value.blank?
      end
    end

    # Render Element
    ::UiComponentHelper.instance_method(element_bind).bind(self).call(element_params, &block)
  end

  def component_config(component_file)
    file_path = File.join(Rails.root, 'app/controllers/concerns/bootstrap/config', component_file)
    file = File.read(file_path)
    YAML.load(file).with_indifferent_access
  end

  #### Helpers

  def check_params_for_value(params, class_type)
    return false unless params.present?

    has_element = params[class_type.to_sym] || params[class_type]
    params.delete(class_type.to_sym)
    params.delete(class_type)
    has_element
  end

end 

