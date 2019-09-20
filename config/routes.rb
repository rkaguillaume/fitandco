Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  root to: 'pages#home'

  get 'dashboard', to: 'dashboards#index'
  resources :courses, only: [:index, :create, :destroy]
end
