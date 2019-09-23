Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  root to: 'pages#home'

  get 'dashboard', to: 'dashboards#index'


  resources :coachs, only: [:index, :create, :edit, :update, :destroy]
  resources :courses, only: [:index, :create, :edit, :update, :destroy] do
    member do
      get 'photo_upload'
    end

    resources :photos, only: [:create, :destroy]
  end
end
