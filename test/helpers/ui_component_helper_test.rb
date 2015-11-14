require 'test_helper'

class UiComponentHelperTest < ActionView::TestCase

  test "headers render" do
    HEADERS.each do |header|
      result = self.send header, classes: "banana" do
        "banana"
      end
      assert_equal "<#{header} class=\"banana\">banana</#{header}>", result
    end
  end

  test "text render" do
    TEXT.each do |header|
      result = self.send header, classes: "banana" do
        "banana"
      end
      assert_equal "<#{header} class=\"banana\">banana</#{header}>", result
    end
  end

  test "table render" do
    TABLE.each do |header|
      result = self.send header, classes: "banana" do
        "banana"
      end
      assert_equal "<#{header} class=\"banana\">banana</#{header}>", result
    end
  end

  test "block render" do
    BLOCK.each do |header|
      result = self.send header, classes: "banana" do
        "banana"
      end
      assert_equal "<#{header} class=\"banana\">banana</#{header}>", result
    end
  end
end
