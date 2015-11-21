module Bootstrap
  module JumbotronHelper
    include UiComponentHelper

    def jumbotron(*args, &block)
      jumbotron = jumbotron_config["jumbotron"]
      component(:div, jumbotron, *args, &block)
    end

    def jumbotron_config
      @jumbotron_config ||= component_config("jumbotron.yml")
    end

  end
end

