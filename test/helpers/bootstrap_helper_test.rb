require 'test_helper'

class Bootstrap::HelperTest < ActionView::TestCase

  test 'included modules is complete' do
    expected_list = [Bootstrap::TableHelper, Bootstrap::NavHelper, Bootstrap::ImageHelper, Bootstrap::ButtonHelper, UiComponentHelper]
    assert_equal expected_list, Bootstrap::Helper.included_modules
  end

end