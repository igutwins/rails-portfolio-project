Rails.application.routes.draw do
  #get 'site/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/githublogin' => 'sessions#github'
  get '/logout' => 'sessions#destroy'
  resources :users, only: [:new, :create] do 
   resources :deals, only: [:index, :new, :destroy]
  end 
  resources :deals, only: [:show, :create, :edit, :update]
  resources :industries, only: [:new, :create]
end
