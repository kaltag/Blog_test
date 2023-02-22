Rails.application.routes.draw do
  devise_scope :user do
    get 'registration', to: 'devise/registrations#new', as: :new_user_registration
  end
  devise_for :users

  resources :posts do
    get '/page/:page', action: :index, on: :collection
  end
  root 'posts#index'

end
