module Bootstrap
  module ButtonHelper
    include UiComponentHelper

    BUTTON_CLASSES = %w( primary secondary success warning danger link ).freeze
    SIZE_CLASSES = %w( lg sm block ).freeze

    def button(*args, &block)
      element_params = args.first || {}

      button_type = element_params[:type] || "button"
      classes = element_params[:class] || ""
      classes << " btn"

      BUTTON_CLASSES.each do |class_type|
        if element_params[class_type.to_sym] && element_params[:outline]
          classes << " btn-#{class_type}-outline"
        elsif element_params[class_type.to_sym]
          classes << " btn-#{class_type}"
        end
      end

      SIZE_CLASSES.each do |class_type|
        classes << " btn-#{class_type}" if element_params[class_type.to_sym]
      end

      %w( active disabled ).each do |class_type|
        classes << " #{class_type}" if element_params[class_type.to_sym]
      end

      ::UiComponentHelper.instance_method(:button).bind(self).call(class: classes, type: button_type, &block)
    end

    def button_group(*args, &block)
      element_params = args.first || {}

      label = element_params[:"aria-label"] || ""
      classes = element_params[:classes] || ""
      classes << " btn-group"

      ::UiComponentHelper.instance_method(:div).bind(self).call(class: classes, role: "group", "aria-label": label, &block)
    end

  end
end

