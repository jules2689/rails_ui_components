Rails.application.routes.draw do
  root 'application#index'

  controller "application" do
    get "table"
    get "headers"
    get "misc"
    get "jumbotron"
    get "labels"
    get "alerts"
    get "progress"
  end
end
