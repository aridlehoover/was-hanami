root to: 'home#index'

resources :alerts, only: [:index, :show, :new, :create]
