root to: 'home#index'

resources :alerts, only: [:index, :new, :create]
