module Bootstrap
  module AlertHelper
    include UiComponentHelper

    CONTEXTUAL_CLASSES = %w( info success warning danger ).freeze
    ALERT_CLASSES = %w( dismissable ).freeze

    def alert(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      classes << " alert"
      
      CONTEXTUAL_CLASSES.each do |class_type|
        classes << " alert-#{class_type}" if check_for_class(element_params, class_type)
      end

      ALERT_CLASSES.each do |class_type|
        classes << " alert-#{class_type}" if check_for_class(element_params, class_type)
      end

      classes << " fade in" if check_for_class(element_params, "fade_in")

      element_params[:class] = classes
      element_params[:role] = "alert"
      ::UiComponentHelper.instance_method(:div).bind(self).call(element_params, &block)
    end

  end
end

