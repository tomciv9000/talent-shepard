Rails.application.routes.draw do

 
  resources :actors do
    resources :appointments
  end
  
  root 'static#home'

  resources :agencies, only: [:index, :new, :create, :show, :edit] do
    resources :users, only: [:index, :show, :new, :edit, :create]
  end

  resources :projects do
    resources :appointments
  end
  

  
  resources :users, only: [:new, :create, :show, :edit]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


end
