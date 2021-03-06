require 'test_helper'

class Bootstrap::TableHelperTest < ActionView::TestCase
  include Bootstrap::Helper
  
  # Table

  test "table render" do
    result = table class: "banana" do
      "banana"
    end
    assert_equal "<table class=\"banana table\">banana</table>", result
  end

  test "table render with classes" do
    classes_for("table", :table_config, "table").each do |t_class|
      result = table class: "banana", "#{t_class}" => true do
        "banana"
      end
      assert_equal "<table class=\"banana table table-#{t_class}\">banana</table>", result
    end
  end

  # Thead

  test "thead render" do
    result = thead class: "banana" do
      "banana"
    end
    assert_equal "<thead class=\"banana\">banana</thead>", result
  end

  test "thead render with classes" do
    classes_for("thead", :table_config, "thead").each do |t_class|
      result = thead class: "banana", "#{t_class}" => true do
        "banana"
      end
      assert_equal "<thead class=\"banana thead-#{t_class}\">banana</thead>", result
    end
  end

  # Tr

  test "tr render" do
    result = tr class: "banana" do
      "banana"
    end
    assert_equal "<tr class=\"banana\">banana</tr>", result
  end

  test "tr render with classes" do
    classes_for("tr", :table_config, "contextual").each do |t_class|
      result = tr class: "banana", "#{t_class}".to_sym => true do
        "banana"
      end
      assert_equal "<tr class=\"banana table-#{t_class}\">banana</tr>", result
    end
  end

  # Td

  test "td render" do
    result = td class: "banana" do
      "banana"
    end
    assert_equal "<td class=\"banana\">banana</td>", result
  end

  test "td render with classes" do
    classes_for("td", :table_config, "contextual").each do |t_class|
      result = td class: "banana", "#{t_class}" => true do
        "banana"
      end
      assert_equal "<td class=\"banana table-#{t_class}\">banana</td>", result
    end
  end

end
