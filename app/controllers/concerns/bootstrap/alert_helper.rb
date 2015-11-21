module Bootstrap
  module AlertHelper
    include UiComponentHelper

    def alert(*args, &block) 
      alert = alert_config["alert"]
      component(:div, alert, *args, &block)
    end

    def alert_config
      @alert_config ||= component_config("alert.yml")
    end

  end
end

