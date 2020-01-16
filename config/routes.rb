Rails.application.routes.draw do
  get 'casting_offices/new'
  get 'casting_offices/show'
  get 'casting_offices/edit'
  root 'static#home'

  resources :actors do
    resources :appointments
  end
  
  resources :agencies, only: [:index, :new, :create, :show, :edit] do
    resources :users
  end

  resources :projects do
    resources :appointments
  end
  
  resources :casting_offices
  resources :bookings
  resources :users
  resources :appointments, only: [:index, :new, :create, :show, :edit]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'


end
