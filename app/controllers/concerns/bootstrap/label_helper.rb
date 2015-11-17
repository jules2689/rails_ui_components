module Bootstrap
  module LabelHelper
    include UiComponentHelper

    CONTEXTUAL_CLASSES = %w( default primary success warning danger ).freeze

    def label(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      classes << " label"
      
      CONTEXTUAL_CLASSES.each do |class_type|
        classes << " label-#{class_type}" if check_for_class(element_params, class_type)
      end
      classes << " label-pill" if check_for_class(element_params, "pill")

      element_params[:class] = classes
      ::UiComponentHelper.instance_method(:span).bind(self).call(element_params, &block)
    end

  end
end

