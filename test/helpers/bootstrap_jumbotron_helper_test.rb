require 'test_helper'

class Bootstrap::JumbotronHelperTest < ActionView::TestCase

  test "jumbotron render" do
    result = jumbotron class: "banana" do
      "banana"
    end
    assert_equal "<div class=\"banana jumbotron\">banana</div>", result
  end

  test "jumbotron render with classes" do
    Bootstrap::JumbotronHelper::JUMBO_CLASSES.each do |a_class|
      result = jumbotron class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<div class=\"banana jumbotron jumbotron-#{a_class}\">banana</div>", result
    end
  end

end
