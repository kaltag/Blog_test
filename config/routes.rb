Rails.application.routes.draw do
  devise_scope :user do
    get 'registration', to: 'devise/registrations#new', as: :new_user_registration
  end
  devise_for :users

  resources :posts do
    get '/page/:page', action: :index, on: :collection
    resources :comments
  end
  root 'posts#index'

  get '/access_denied', to: 'home#access_deny', as: :access_denied

end
