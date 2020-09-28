Rails.application.routes.draw do
  root to: 'studies#top'
  resources :studies do
  collection do
    get 'analysis'
    get 'top'
  end
end
end
