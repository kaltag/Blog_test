Rails.application.routes.draw do
  scope '(:locale)', locale: /ru|en/ do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_scope :user do
      get 'registration', to: 'devise/registrations#new', as: :new_user_registration
    end
    devise_for :users

    resources :posts do
      get '/page/:page', action: :index, on: :collection
      resources :comments
    end
    resources :tags

    get '/access_denied', to: 'home#access_deny', as: :access_denied

    root 'posts#index'
  end
end
