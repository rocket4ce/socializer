Socializer::Application.routes.draw do
  
  # get "uploads/create"
  # get "uploads/destroy"

  resources :perfiles, only: [:show, :update]

  # resources :portafolios

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  resources :users do
    resources :portafolios, except: [:index] do
      resources :comentarios
      resources :uploads, only: [:destroy]
    end
    member do
      post :follow
    end
  end


  devise_scope :user do
    get "registrate", to: "registrations#new", as: :registrate
    get "entrar", to: "devise/sessions#new", as: :entrar
    get "editar", to: "registrations#edit", as: :editar
    delete "salir", to: "devise/sessions#destroy", as: :salir
  end




end

