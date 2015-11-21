module Bootstrap
  module ImageHelper
    include UiComponentHelper
   
    def image(*args, &block) 
      image = image_config["image"]
      component(:img, image, *args, &block)
    end

    def image_config
      @image_config ||= component_config("image.yml")
    end

  end
end

