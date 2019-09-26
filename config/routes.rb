Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  root to: 'pages#home'
  get 'les-cours', to: 'pages#courses'
  get 'les-coachs', to: 'pages#coachs'
  get 'planning-des-cours', to: 'pages#plannings'

  get 'dashboard', to: 'dashboards#index'

  resources :plannings, only: [:index, :create, :edit, :update, :destroy]
  resources :coachs, only: [:index, :create, :edit, :update, :destroy]
  resources :courses, only: [:index, :create, :edit, :update, :destroy] do
    member do
      get 'photo_upload'
    end

    resources :photos, only: [:create, :destroy]
  end
end
