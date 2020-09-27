Rails.application.routes.draw do
  root to: 'studies#index'
  resources :studies do
  collection do
    get 'analysis'
  end
end
end
