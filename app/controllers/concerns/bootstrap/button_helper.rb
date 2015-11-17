module Bootstrap
  module ButtonHelper
    include UiComponentHelper

    BUTTON_CLASSES = %w( primary secondary success warning danger link ).freeze
    SIZE_CLASSES = %w( lg sm block ).freeze
    ACTIVE_CLASSES = %w( active disabled ).freeze

    def button(*args, &block)
      element_params = args.first || {}

      button_type = element_params[:type] || "button"
      classes = element_params[:class] || ""
      classes << " btn"

      BUTTON_CLASSES.each do |class_type|
        if check_for_class(element_params, class_type) && check_for_class(element_params, "outline")
          classes << " btn-#{class_type}-outline"
        elsif check_for_class(element_params, class_type)
          classes << " btn-#{class_type}"
        end
      end

      SIZE_CLASSES.each do |class_type|
        classes << " btn-#{class_type}" if check_for_class(element_params, class_type)
      end

      ACTIVE_CLASSES.each do |class_type|
        classes << " #{class_type}" if check_for_class(element_params, class_type)
      end

      element_params[:class] = classes
      element_params[:type] = button_type
      ::UiComponentHelper.instance_method(:button).bind(self).call(element_params, &block)
    end

    def button_group(*args, &block)
      element_params = args.first || {}

      label = element_params[:"aria-label"] || element_params["aria-label"] || ""
      classes = element_params[:class] || ""
      classes << " btn-group"

      element_params[:class] = classes
      element_params[:role] = "group"
      element_params["aria-label"] = label
      ::UiComponentHelper.instance_method(:div).bind(self).call(element_params, &block)
    end

  end
end

