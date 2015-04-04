Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch 'capture', to: 'pokemon#capture'
  patch 'damage', to: 'pokemon#damage'
  get 'pokemons', to: 'pokemon#new'
  post 'pokemons', to: 'pokemon#create'
end
