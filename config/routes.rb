Rails.application.routes.draw do
  get 'admins/index'
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admins/sessions#new_guest'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end


  root to: 'studies#top'

  resources :rooms, only:[:index, :new, :create] do
    collection do
      get 'login'
    end
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
