module Bootstrap
  module LabelHelper
    include UiComponentHelper

    def label(*args, &block)
      label = label_config["label"]
      component(:span, label, *args, &block)
    end

    def label_config
      @label_config ||= component_config("label.yml")
    end

  end
end

