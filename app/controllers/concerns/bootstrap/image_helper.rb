module Bootstrap
  module ImageHelper
    include UiComponentHelper

    IMAGE_CLASSES = %w( rounded circle thumbnail responsive ).freeze

    def image(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      alt = element_params[:alt] || ""
      src = element_params[:src] || ""
      
      IMAGE_CLASSES.each do |class_type|
        classes << " img-#{class_type}" if element_params[class_type.to_sym]
      end

      ::UiComponentHelper.instance_method(:image).bind(self).call(classes: classes, alt: alt, src: src, &block)
    end

  end
end

