Rails.application.routes.draw do
  root to: 'studies#top'
  devise_for :users
  resources :studies do
  collection do
    get 'analysis'
    get 'top'
  end
end
end
