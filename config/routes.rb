Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, only: %w[index show new create desrtoy]
  end
end
