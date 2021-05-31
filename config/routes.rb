Rails.application.routes.draw do
  #get 'site/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
  get '/login' => 'sessions#new'
  #get '/auth/facebook/callback' => 'sessions#createfb'
  get '/auth/:provider/callback' => 'sessions#create'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :deals, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :create]
end
