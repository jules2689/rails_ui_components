require 'test_helper'

class Bootstrap::AlertHelperTest < ActionView::TestCase

  test "alert render" do
    result = alert class: "banana" do
      "banana"
    end
    assert_equal "<div class=\"banana alert\" role=\"alert\">banana</div>", result
  end

  test "alert render with contextual classes" do
    Bootstrap::AlertHelper::CONTEXTUAL_CLASSES.each do |a_class|
      result = alert class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<div class=\"banana alert alert-#{a_class}\" role=\"alert\">banana</div>", result
    end
  end

  test "alert render with alert classes" do
    Bootstrap::AlertHelper::ALERT_CLASSES.each do |a_class|
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
