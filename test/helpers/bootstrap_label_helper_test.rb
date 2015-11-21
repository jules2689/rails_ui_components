require 'test_helper'

class Bootstrap::LabelHelperTest < ActionView::TestCase
  include Bootstrap::Helper
  
  test "label render" do
    result = label class: "banana" do
      "banana"
    end
    assert_equal "<span class=\"banana label\">banana</span>", result
  end

  test "label render with contextual classes" do
    classes_for("label", :label_config, "contextual").each do |a_class|
      result = label class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<span class=\"banana label label-#{a_class}\">banana</span>", result
    end
  end

  test "label render with pill" do
    result = label class: "banana", pill: true do
      "banana"
    end
    assert_equal "<span class=\"banana label label-pill\">banana</span>", result
  end

end
