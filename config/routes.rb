Rails.application.routes.draw do
  resources :subcategories, only: [:index, :show] do
    resources :questions, only: [:show]
  end

  resources :trainings, only: [:index, :show] do
    get 'play' => 'trainings#play'
    get 'finished' => 'trainings#finished'
    get 'resolve' => 'trainings#resolve'
    get 'replay' => 'trainings#replay'
  end

  resources :shop, only: [:index, :buy, :choice] do
    get 'buy' => 'shop#buy'
    get 'choice' => 'shop#choice'
  end

  devise_for :users

  resources :users, only: [] do
    collection do
      get :profil
    end
  end

  get 'users/rank', to: "users#rank"
  # get 'users/profil', to: 'users#profil'


  resources :inventories, only: [:edit, :update, :delete] do
    collection do
      get :myitems
    end
  end

  # resources :users

  # creation de routes pour USERS/RANK
  # get 'rank', to: "users#rank"

  # creation de routes pour USERS/show
  get "home", to: "users#show"
  root to: "users#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
