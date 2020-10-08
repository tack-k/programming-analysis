Rails.application.routes.draw do
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'studies#top'

  resources :rooms, only:[:index, :new, :create] do
    resources :messages, only:[:index, :new, :create]
  end

  resources :studies do
    collection do
      get 'analysis'
      get 'top'
      get 'finish'
    end
  end
end