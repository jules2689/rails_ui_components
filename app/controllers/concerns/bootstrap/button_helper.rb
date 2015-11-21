module Bootstrap
  module ButtonHelper
    include UiComponentHelper

    def button(*args, &block) 
      button = button_config["button"]
      component(:button, button, *args, &block)
    end

    def button_group(*args, &block)
      button_group = button_config["button_group"]
      component(:div, button_group, *args, &block)
    end

    def button_config
      @button_config ||= component_config("buttons.yml")
    end

  end
end

