Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}
  devise_scope :user do
    get "/users/sign_out" => 'users/sessions#destroy'
  end

  root to: 'static#home'

  resources :actors do
    resources :appointments
  end
  
  resources :agencies, only: [:index, :new, :create, :show, :edit] do
    resources :users
  end

  resources :projects do
    resources :appointments
  end
  
  get '/projects/:id/confirm_delete', to: 'projects#confirm_delete', as: 'confirm_project_delete'
  get '/actors/:id/confirm_delete', to: 'actors#confirm_delete', as: 'confirm_actor_delete'
  get '/appointments/:id/confirm_delete', to: 'appointments#confirm_delete', as: 'confirm_appointment_delete'


  resources :casting_offices
  resources :bookings
  resources :users
  resources :appointments, only: [:index, :new, :create, :show, :edit]
  

end
