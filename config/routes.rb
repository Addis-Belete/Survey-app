Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  shallow do
    resources :users do
      resources :questions, :answers
    end
  end
end
