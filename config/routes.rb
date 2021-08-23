Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :plants, only: %i[create show destroy]
  resources :species, only: %i[index show]
  resources :waterings, only: %i[create]
  resources :eplants, only: %i[new create show update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
