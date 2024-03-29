Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "users#index"
  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  resources :users do
    resources :surveys, only: [:new, :create, :update, :destroy] do
      resources :questions, only: [:new, :create, :update, :destroy]
    end
  end
  resources :surveys, only: [:index, :show] do
    resources :questions, only: [:index, :show]
  end
end
