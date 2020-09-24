Rails.application.routes.draw do
  root to: 'studies#index'
  resources :studies, only: [:index]
end
