Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
      get "/message/random", to: "messages#show"
    end
  end

  get "*path", to: "pages#index", via: :all
end
