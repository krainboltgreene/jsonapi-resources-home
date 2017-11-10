Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount JSONAPI::Resources::Home::Engine, at: "/"

  namespace :v1 do
    jsonapi_resources :accounts
  end
end
