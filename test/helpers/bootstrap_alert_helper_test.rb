require 'test_helper'

class Bootstrap::AlertHelperTest < ActionView::TestCase
  include Bootstrap::Helper

  test "alert render" do
    result = alert class: "banana" do
      "banana"
    end
    assert_equal "<div class=\"banana alert\" role=\"alert\">banana</div>", result
  end

  test "alert render with contextual classes" do
    classes_for("alert", :alert_config, "contextual").each do |a_class|
      result = alert class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<div class=\"banana alert alert-#{a_class}\" role=\"alert\">banana</div>", result
    end
  end

  test "alert render with alert classes" do
    classes_for("alert", :alert_config, "alert").each do |a_class|
      result = alert class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<div class=\"banana alert alert-#{a_class}\" role=\"alert\">banana</div>", result
    end
  end

  test "alert render with fade in" do
    result = alert class: "banana", fade_in: true do
      "banana"
    end
    assert_equal "<div class=\"banana alert fade in\" role=\"alert\">banana</div>", result
  end

end
