Rails.application.routes.draw do
  resources :customers do
    resources :tickets, only: [:index, :show, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
