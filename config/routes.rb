Rails.application.routes.draw do
  devise_for :users
  root to: 'studies#top'
  resources :studies do
  collection do
    get 'analysis'
    get 'top'
  end
end
end
