require 'test_helper'

class Bootstrap::ProgressHelperTest < ActionView::TestCase
  include Bootstrap::Helper
  
  test "progress render" do
    result = progress class: "banana" do
      "banana"
    end
    assert_equal "<progress class=\"banana progress\">banana</progress>", result
  end

  test "label render with contextual classes" do
    classes_for("progress", :progress_config, "contextual").each do |a_class|
      result = progress class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<progress class=\"banana progress progress-#{a_class}\">banana</progress>", result
    end

    classes_for("progress", :progress_config, "progress").each do |a_class|
      result = progress class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<progress class=\"banana progress progress-#{a_class}\">banana</progress>", result
    end
  end

end
