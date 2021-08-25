Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :plants, only: %i[index show destroy]
  get '/species', to: 'species#index'
  get '/species/:id', to: 'species#show', as: 'specie'
  post '/species/:specie_id/plants', to: 'plants#create', as: 'species_plants'
  resources :waterings, only: %i[create]
  resources :eplants, only: %i[new create show update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
