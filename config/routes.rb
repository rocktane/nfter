Rails.application.routes.draw do
  devise_for :users
  root to: "nfts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :nfts, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :transactions, only: [:create]
  end
  get "profile", to: "pages#show"
  patch "transactions/:id/validate", to: "transactions#validate", as: "validate"
  patch "transactions/:id/refuse", to: "transactions#refuse", as: "refuse"
end
