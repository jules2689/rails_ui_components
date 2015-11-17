module Bootstrap
  module JumbotronHelper
    include UiComponentHelper

    JUMBO_CLASSES = %w( fluid ).freeze

    def jumbotron(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      classes << " jumbotron"
      
      JUMBO_CLASSES.each do |class_type|
        classes << " jumbotron-#{class_type}" if check_for_class(element_params, class_type)
      end

      element_params[:class] = classes
      ::UiComponentHelper.instance_method(:div).bind(self).call(element_params, &block)
    end

  end
end

