require 'test_helper'

class Bootstrap::HelperTest < ActionView::TestCase
  include Bootstrap::Helper
  
  test 'included modules is complete' do
    expected_list = [Bootstrap::NavHelper, UiComponentHelper]
    assert_equal expected_list, Bootstrap::Helper.included_modules
  end

end
