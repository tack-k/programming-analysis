Rails.application.routes.draw do
  root to: 'studies#index'
  resources :studies, only: [:index] do
  collection do
    get 'analysis'
  end
end
end
