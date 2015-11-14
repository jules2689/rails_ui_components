module Foundation
  module TableHelper
    include UiComponentHelper

    CONTEXTUAL_CLASSES = %w( active success info warning danger ).freeze
    TABLE_CLASSES = %w( striped bordered hover inverse sm reflow ).freeze
    HEAD_CLASSES = %w( inverse default ).freeze
    GENERAL_CLASSES = [TABLE_CLASSES, CONTEXTUAL_CLASSES].freeze

    def table(*args, &block)
      element_params = args.first || {}

      classes = element_params[:classes] || ""
      classes << " foundation"
      GENERAL_CLASSES.flatten.each do |class_type|
        classes << " table-#{class_type}" if element_params[class_type.to_sym]
      end

      if element_params[:responsive]
        div classes: "table-responsive" do
          call_super(:table, classes, &block)
        end
      else
        call_super(:table, classes, &block)
      end
    end

    def thead(*args, &block)
      element_params = args.first || {}

      classes = element_params[:classes] || ""
      HEAD_CLASSES.each do |class_type|
        classes << " thead-#{class_type}" if element_params[class_type.to_sym]
      end

      call_super(:thead, classes, &block)
    end

    def tr(*args, &block)
      element_params = args.first || {}

      classes = element_params[:classes] || ""
      CONTEXTUAL_CLASSES.each do |class_type|
        classes << " table-#{class_type}" if element_params[class_type.to_sym]
      end

      call_super(:tr, classes, &block)
    end

    def td(*args, &block)
      element_params = args.first || {}

      classes = element_params[:classes] || ""
      CONTEXTUAL_CLASSES.each do |class_type|
        classes << " table-#{class_type}" if element_params[class_type.to_sym]
      end

      call_super(:td, classes, &block)
    end

  end
end
