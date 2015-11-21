require 'test_helper'

class Bootstrap::JumbotronHelperTest < ActionView::TestCase
  include Bootstrap::Helper
  
  test "jumbotron render" do
    result = jumbotron class: "banana" do
      "banana"
    end
    assert_equal "<div class=\"banana jumbotron\">banana</div>", result
  end

  test "jumbotron render with classes" do
    classes_for("jumbotron", :jumbotron_config, "jumbotron").each do |a_class|
      result = jumbotron class: "banana", "#{a_class}" => true do
        "banana"
      end
      assert_equal "<div class=\"banana jumbotron jumbotron-#{a_class}\">banana</div>", result
    end
  end

end
