require 'sidekiq/web'

LeadMailer::Application.routes.draw do

  # devise_for :users

  root to: "pages#index"

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks',:registrations => "registrations" }
  # devise_for :users, :controllers => {  }

  devise_scope :users do
    get 'users/auth/failure' => 'users/omniauth_callbacks#failed'
  end

  namespace :users do
    resources :contacts
  end

  match "/contacts/:importer/callback" => "users/contacts#callback",  via: [:get, :post]

  resources :campaigns

  resources :materials

  resources :emailtemplates, controller: "email_templates"

  mount Sidekiq::Web, at: '/sidekiq'

  get '/sendemail/:id', to: 'materials#sendemail', as: 'sendemail'

end
