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
        classes << " bg-#{class_type}" if check_for_class(element_params, class_type)
      end

      NAV_CLASSES.each do |class_type|
        classes << " navbar-#{class_type}" if check_for_class(element_params, class_type)
      end

      classes << " navbar-light" unless classes.include?("navbar-")
      classes << " bg-faded" unless classes.include?("bg-")

      ::UiComponentHelper.instance_method(:nav).bind(self).call(class: classes.strip, &block)
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

      ## FIXME: TODO: Button not outputting
      div do
        button class: "navbar-toggler hidden-sm-up", type: "button", "data-toggle" => "collapse", "data-target" => "##{id}" do
          "&#9776;"
        end
        div class: "collapse navbar-toggleable-xs", id: id, &block
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

