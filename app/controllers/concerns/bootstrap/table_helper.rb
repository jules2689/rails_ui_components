module Bootstrap
  module TableHelper
    include UiComponentHelper

    def table(*args, &block)
      table = table_config["table"]
      if check_params_for_value(args.first, "responsive")
        div class: "table-responsive" do
          component(:table, table, *args, &block)
        end
      else
        component(:table, table, *args, &block)
      end
    end

    def thead(*args, &block)
      thead = table_config["thead"]
      component(:thead, thead, *args, &block)
    end

    def tr(*args, &block)
      tr = table_config["tr"]
      component(:tr, tr, *args, &block)
    end

    def td(*args, &block)
      td = table_config["td"]
      component(:td, td, *args, &block)
    end

    def table_config
      @table_config ||= component_config("table.yml")
    end

  end
end

