require 'test_helper'

class UiComponentHelperTest < ActionView::TestCase

  test "headers render" do
    HEADERS.each do |header|
      result = self.send header, class: "banana" do
        "banana"
      end
      assert_equal "<#{header} class=\"banana\">banana</#{header}>", result
    end
  end

  test "text render" do
    TEXT.each do |t|
      result = self.send t, class: "banana" do
        "banana"
      end
      assert_equal "<#{t} class=\"banana\">banana</#{t}>", result
    end
  end

  test "table render" do
    TABLE.each do |t|
      result = self.send t, class: "banana" do
        "banana"
      end
      assert_equal "<#{t} class=\"banana\">banana</#{t}>", result
    end
  end

  test "block render" do
    BLOCK.each do |block_element|
      result = self.send block_element, class: "banana" do
        "banana"
      end
      assert_equal "<#{block_element} class=\"banana\">banana</#{block_element}>", result
    end
  end

  test "list render" do
    LIST.each do |l|
      result = self.send l, class: "banana" do
        "banana"
      end
      assert_equal "<#{l} class=\"banana\">banana</#{l}>", result
    end
  end

  test "code render" do
    CODE.each do |code|
      result = self.send code, class: "banana" do
        "banana"
      end
      assert_equal "<#{code} class=\"banana\">banana</#{code}>", result
    end
  end

  test "figure render" do
    FIGURE.each do |fig|
      result = self.send fig, class: "banana" do
        "banana"
      end
      assert_equal "<#{fig} class=\"banana\">banana</#{fig}>", result
    end
  end

  test "misc render" do
    MISC.each do |misc|
      result = self.send misc, class: "banana" do
        "banana"
      end
      assert_equal "<#{misc} class=\"banana\">banana</#{misc}>", result
    end
  end

  test "nav render" do
    NAV.each do |nav|
      result = self.send nav, class: "banana" do
        "banana"
      end
      assert_equal "<#{nav} class=\"banana\">banana</#{nav}>", result
    end
  end

  test "image render" do
    result = self.send :img, class: "banana", src: "...", alt: "alt" do
      "banana"
    end
    assert_equal "<img class=\"banana\" src=\"...\" alt=\"alt\">banana</img>", result
  end

  test "methods strip classes" do
    result = h1 class: "  banana  " do
      "banana"
    end
    assert_equal "<h1 class=\"banana\">banana</h1>", result
  end

end
