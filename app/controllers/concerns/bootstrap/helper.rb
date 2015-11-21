module Bootstrap
  module Helper
    include UiComponentHelper
    include NavHelper

    Dir[File.join(Rails.root, 'app/controllers/concerns/bootstrap/config/*.yml')].each do |file_path|
      yaml = YAML.load(File.read(file_path)).with_indifferent_access

      # Define config accessors
      basename = File.basename(file_path, '.yml')
      define_method "#{basename}_config" do
        component_config File.basename(file_path)
      end

      # Define methods per entry (e.g. button, label, jumbotron) from the YAML 
      yaml.each do |key, config|
        define_method key do |*args, &block|
          component(config["bind_element"], config, *args, &block)
        end
      end

    end

  end
end
