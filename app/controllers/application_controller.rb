class ApplicationController < ActionController::Base
  helper Bootstrap::Helper
  protect_from_forgery with: :exception

  def index
  end
end
