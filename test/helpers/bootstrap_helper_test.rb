require 'test_helper'

class Bootstrap::HelperTest < ActionView::TestCase

  test 'included modules is complete' do
    expected_list = [Bootstrap::TableHelper, Bootstrap::NavHelper, Bootstrap::JumbotronHelper, 
                     Bootstrap::LabelHelper, Bootstrap::ImageHelper, Bootstrap::ButtonHelper, 
                     Bootstrap::AlertHelper, UiComponentHelper]
    assert_equal expected_list, Bootstrap::Helper.included_modules
  end

end
