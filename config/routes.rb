Rails.application.routes.draw do
 

  resources :agencies, only: [:new, :create, :show, :edit] do
    resources :users, only: [:index, :show, :new, :edit]
  end

  
  resources :users, only: [:new, :create, :show, :edit]
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
