require 'test_helper'

class Bootstrap::ButtonHelperTest < ActionView::TestCase

  # Button

  test "button render" do
    result = button class: "banana" do
      "banana"
    end
    assert_equal "<button class=\"banana btn\" type=\"button\">banana</button>", result
  end

  test "button render with label" do
    result = button class: "banana", "aria-label" => "test_label" do
      "banana"
    end
    assert_equal "<button class=\"banana btn\" aria-label=\"test_label\" type=\"button\">banana</button>", result
    
    result2 = button class: "banana", label: "test_label" do
      "banana"
    end
    assert_equal "<button class=\"banana btn\" aria-label=\"test_label\" type=\"button\">banana</button>", result2
  end

  test "button render with classes" do
    Bootstrap::ButtonHelper::BUTTON_CLASSES.each do |b_class|
      result = button class: "banana", "#{b_class}" => true do
        "banana"
      end
      assert_equal "<button class=\"banana btn btn-#{b_class}\" type=\"button\">banana</button>", result
    end
  end

  test "button render with classes and outline" do
    Bootstrap::ButtonHelper::BUTTON_CLASSES.each do |b_class|
      result = button class: "banana", "#{b_class}" => true, outline: true do
        "banana"
      end
      assert_equal "<button class=\"banana btn btn-#{b_class}-outline\" type=\"button\">banana</button>", result
    end
  end

  test "button render with size classes" do
    Bootstrap::ButtonHelper::SIZE_CLASSES.each do |b_class|
      result = button class: "banana", "#{b_class}" => true do
        "banana"
      end
      assert_equal "<button class=\"banana btn btn-#{b_class}\" type=\"button\">banana</button>", result
    end
  end

  test "button render with active classes" do
    Bootstrap::ButtonHelper::ACTIVE_CLASSES.each do |b_class|
      result = button class: "banana", "#{b_class}" => true do
        "banana"
      end
      assert_equal "<button class=\"banana btn #{b_class}\" type=\"button\">banana</button>", result
    end
  end

  # Button Group

  test "button group render" do
    result = button_group class: "banana" do
      "banana"
    end
    assert_equal "<div class=\"banana btn-group\" role=\"group\">banana</div>", result
  end

  test "button group render with label" do
    result = button_group class: "banana", "aria-label" => "Label" do
      "banana"
    end
    assert_equal "<div class=\"banana btn-group\" role=\"group\" aria-label=\"Label\">banana</div>", result

    result2 = button_group class: "banana", label: "Label" do
      "banana"
    end
    assert_equal "<div class=\"banana btn-group\" role=\"group\" aria-label=\"Label\">banana</div>", result2
  end

end

