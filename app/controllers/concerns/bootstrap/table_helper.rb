module Bootstrap
  module TableHelper
    include UiComponentHelper

    CONTEXTUAL_CLASSES = %w( active success info warning danger ).freeze
    TABLE_CLASSES = %w( striped bordered hover inverse sm reflow ).freeze
    HEAD_CLASSES = %w( inverse default ).freeze
    GENERAL_CLASSES = [TABLE_CLASSES, CONTEXTUAL_CLASSES].flatten.freeze

    def table(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      classes << " table"
      
      GENERAL_CLASSES.each do |class_type|
        classes << " table-#{class_type}" if check_for_class(element_params, class_type)
      end

      element_params[:class] = classes
      if check_for_class(element_params, "responsive")
        div class: "table-responsive" do
          call_super(:table, element_params, &block)
        end
      else
        call_super(:table, element_params, &block)
      end
    end

    def thead(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      HEAD_CLASSES.each do |class_type|
        classes << " thead-#{class_type}" if check_for_class(element_params, class_type)
      end

      element_params[:class] = classes
      call_super(:thead, element_params, &block)
    end

    def tr(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      CONTEXTUAL_CLASSES.each do |class_type|
        classes << " table-#{class_type}" if check_for_class(element_params, class_type)
      end

      element_params[:class] = classes
      call_super(:tr, element_params, &block)
    end

    def td(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      CONTEXTUAL_CLASSES.each do |class_type|
        classes << " table-#{class_type}" if check_for_class(element_params, class_type)
      end

      element_params[:class] = classes
      call_super(:td, element_params, &block)
    end

  end
end

