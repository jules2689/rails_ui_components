require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  def self.app_routes
    r = ApplicationController._routes.named_routes.names
    r.delete(:root)
    r.push(:index)
    r
  end

  self.app_routes.each do |action|
    test "#{action} action renders" do
      get action
      assert_response :success
    end
  end

end

