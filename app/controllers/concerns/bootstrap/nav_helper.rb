module Bootstrap
  module NavHelper
    include UiComponentHelper

    BG_CLASSES = %w( primary faded inverse ).freeze
    NAV_CLASSES = %w( nav form toggler dark light fixed-bottom fixed-top ).freeze

    ##
    # TODO: RESPONSIVE NAVS
    ##

    def nav(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || "navbar-light"
      classes << " navbar"

      BG_CLASSES.each do |class_type|
        classes << " bg-#{class_type}" if check_params_for_value(element_params, class_type)
      end

      NAV_CLASSES.each do |class_type|
        classes << " navbar-#{class_type}" if check_params_for_value(element_params, class_type)
      end

      classes << " navbar-light" unless classes.include?("navbar-")
      classes << " bg-faded" unless classes.include?("bg-")

      element_params[:class] = classes
      ::UiComponentHelper.instance_method(:nav).bind(self).call(element_params, &block)
    end

    def nav_dropdown(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || "navbar-light"
      classes << " dropdown"

      # Figure out some button element params
      button_element_params = element_params[:button] || {}
      button_element_params[:id] = check_params_for_value(button_element_params, "dropdown_id") || "dropdown_id"

      button_element_params[:class] ||= ""
      button_element_params[:class] << "dropdown-toggle" if check_params_for_value(element_params, "show_toggle_icon")

      button_element_params["data-toggle"] = "dropdown"
      button_element_params["aria-haspopup"] = "true"
      button_element_params["aria-expanded"] = "false"

      # Render HTML to render it together
      button_html = button button_element_params do
        check_params_for_value(element_params, "dropdown_title") || "&#9776;".html_safe
      end

      menu_html = div class: "dropdown-menu", "aria-labelled" => button_element_params[:id], &block

      div class: classes.strip do
        button_html + menu_html
      end
    end

    def nav_brand(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      classes << " navbar-brand"

      nav_link = element_params[:nav_link] || "/"

      a class: classes.strip, href: nav_link, &block
    end

    def nav_responsive_wrapper(*args, &block)
      element_params = args.first || {}
      id = element_params[:id] || "responsive_nav"

      button_html = button class: "navbar-toggler hidden-sm-up", type: "button", "data-toggle" => "collapse", "data-target" => "##{id}" do
        "&#9776;".html_safe
      end

      nav_html = div class: "collapse navbar-toggleable-xs", id: id, &block

      div do
        button_html + nav_html
      end
    end

    def nav_links(*args, &block)
      element_params = args.first || {}

      classes = element_params[:class] || ""
      classes << " nav navbar-nav"

      ul class: classes.strip, &block
    end

    def nav_link(*args, &block)
      element_params = args.first || {}

      nav_link = element_params[:link] || "/"
      nav_link = "/#{nav_link}" unless nav_link.start_with?("/") || nav_link.start_with?("http")

      classes = element_params[:class] || ""
      classes << " nav-item"
      classes << " active" if current_page?(nav_link)

      li class: classes.strip do
        a class: "nav-link", href: nav_link, &block
      end
    end

  end
end

