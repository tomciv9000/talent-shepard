Rails.application.routes.draw do
 
  get 'organizations/new'
  get 'organizations/create'
  get 'organizations/edit'

  
  resources :users, only: [:new, :create, :show, :edit]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
