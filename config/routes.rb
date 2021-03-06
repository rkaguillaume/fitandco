Rails.application.routes.draw do
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }

  root to: 'pages#home'
  get 'cours-fitandco', to: 'pages#courses'
  get 'coachs-fitandco', to: 'pages#coachs'
  get 'planning-cours-fitandco', to: 'pages#plannings'
  get 'abonnements-fitandco', to: 'pages#subscriptions'
  get 'contact', to: 'pages#contact_us'
  get "conditions-generales-utilisation", to: "pages#general_condition_sale"
  get "mentions-legales", to: "pages#legal_notices"

  post 'contact-me', to: 'messages#create', as: 'create_message'

  resource :user do
    resource :contact, only: [:create, :edit, :update]
  end

  get 'dashboard', to: 'dashboards#index'

  resources :landingpictures, only: [:index, :create, :destroy]
  resources :plannings, only: [:index, :create, :edit, :update, :destroy]
  resources :prices, only: [:index, :create, :edit, :update, :destroy]
  resources :coachs, only: [:index, :create, :edit, :update, :destroy]
  resources :courses, only: [:index, :create, :edit, :update, :destroy] do
    member do
      get 'photo_upload'
    end

    resources :photos, only: [:create, :destroy]
  end
end
