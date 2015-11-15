Rails.application.routes.draw do
  root 'application#index'

  controller "application" do
    get "table"
    get "headers"
    get "misc"
  end
end
