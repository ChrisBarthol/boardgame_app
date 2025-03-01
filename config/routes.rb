Rails.application.routes.draw do
  devise_for :users
  root "games#index"

  # API routes
  namespace :api, defaults: { format: :json } do
    resources :games, only: [:index]
  end

  resources :games, only: :index
  
  get 'fetch_bgg_data', to: 'bgg#fetch_data'
end
