Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/calendar', to: 'users#calendar'
  resources :plants, only: %i[show destroy] do
    resources :waterings, only: %i[create]
  end
  get '/species', to: 'species#index'
  get '/species/:id', to: 'species#show', as: 'specie'
  post '/species/:specie_id/plants', to: 'plants#create', as: 'species_plants'
  resources :eplants, only: %i[new create show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
