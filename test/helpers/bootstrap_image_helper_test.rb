require 'test_helper'

class Bootstrap::ImageHelperTest < ActionView::TestCase

  test "image render" do
    result = image class: "banana" do
      "banana"
    end
    assert_equal "<img src=\"\" class=\"banana\" alt=\"\">banana</img>", result
  end

  test "image render with classes" do
    Bootstrap::ImageHelper::IMAGE_CLASSES.each do |i_class|
      result = image class: "banana", "#{i_class}" => true do
        "banana"
      end
      assert_equal "<img src=\"\" class=\"banana img-#{i_class}\" alt=\"\">banana</img>", result
    end
  end

  test "image render with alt and src" do
    result = image class: "banana", alt: "alt", src: "..." do
      "banana"
    end
    assert_equal "<img src=\"...\" class=\"banana\" alt=\"alt\">banana</img>", result
  end

end
