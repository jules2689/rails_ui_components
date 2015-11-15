require 'test_helper'

class Bootstrap::NavHelperTest < ActionView::TestCase

  # Nav

  test "nav render" do
    result = nav class: "banana" do
      "banana"
    end
    assert_equal "<nav class=\"banana navbar navbar-light bg-faded\">banana</nav>", result
  end

  test "nav render with bg classes" do
    Bootstrap::NavHelper::BG_CLASSES.each do |n_class|
      result = nav class: "banana", "#{n_class}" => true do
        "banana"
      end
      assert_equal "<nav class=\"banana navbar bg-#{n_class} navbar-light\">banana</nav>", result
    end
  end

  test "nav render with nav classes" do
    Bootstrap::NavHelper::NAV_CLASSES.each do |n_class|
      result = nav class: "banana", "#{n_class}" => true do
        "banana"
      end
      assert_equal "<nav class=\"banana navbar navbar-#{n_class} bg-faded\">banana</nav>", result
    end
  end

  # Nav Brand

  test "nav_brand render" do
    result = nav_brand class: "banana" do
      "banana"
    end
    assert_equal "<a class=\"banana navbar-brand\" href=\"/\">banana</a>", result
  end

  test "nav_brand render with link" do
    result = nav_brand class: "banana", nav_link: "..." do
      "banana"
    end
    assert_equal "<a class=\"banana navbar-brand\" href=\"...\">banana</a>", result
  end

  # Nav Links

  test "nav_links render" do
    result = nav_links class: "banana" do
      "banana"
    end
    assert_equal "<ul class=\"banana nav navbar-nav\">banana</ul>", result
  end

  # Nav Link

  test "nav_link render" do
    self.expects(:current_page?).returns(false)

    result = nav_link class: "banana" do
      "banana"
    end
    assert_equal "<li class=\"banana nav-item\"><a class=\"nav-link\" href=\"/\">banana</a></li>", result
  end

  test "nav_link render on active page" do
    self.expects(:current_page?).returns(true)

    result = nav_link class: "banana" do
      "banana"
    end
    assert_equal "<li class=\"banana nav-item active\"><a class=\"nav-link\" href=\"/\">banana</a></li>", result
  end

  test "nav_link render with link" do
    self.stubs(:current_page?).returns(false)

    # Without leading / or http
    result = nav_link class: "banana", link: "banana" do
      "banana"
    end
    assert_equal "<li class=\"banana nav-item\"><a class=\"nav-link\" href=\"/banana\">banana</a></li>", result
  
    # With leading /
    result = nav_link class: "banana", link: "/banana" do
      "banana"
    end
    assert_equal "<li class=\"banana nav-item\"><a class=\"nav-link\" href=\"/banana\">banana</a></li>", result
    
    # As HTTP link
    result = nav_link class: "banana", link: "http://example.com" do
      "banana"
    end
    assert_equal "<li class=\"banana nav-item\"><a class=\"nav-link\" href=\"http://example.com\">banana</a></li>", result
  end


end
