Rails.application.routes.draw do
  devise_for :users
  root "hello#index"

  resources :games, only: :index
  
  get 'fetch_bgg_data', to: 'bgg#fetch_data'
end
