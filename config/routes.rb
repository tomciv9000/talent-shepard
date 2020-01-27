Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get "/users/sign_out" => 'users/sessions#destroy'
    get '/users/registrations/agency_for_facebook', to: 'users/registrations#agency_for_facebook', as: 'agency_for_facebook'
    get '/users/registrations/facebook_new', to: 'users/registrations#facebook_new', as: 'facebook_user_registration'
    
  
  end

  root to: 'static#home'

  resources :actors do
    collection do
      get 'sag'
      get 'aea'
      get 'nonunion'
    end
    resources :appointments
  end

  #resources :actors do
  #  resources :appointments
  #end
  
  resources :agencies, only: [:index, :new, :create, :show, :edit] do
    resources :users
  end

  resources :projects do
    resources :appointments
  end
  
  get '/projects/:id/confirm_delete', to: 'projects#confirm_delete', as: 'confirm_project_delete'
  get '/actors/:id/confirm_delete', to: 'actors#confirm_delete', as: 'confirm_actor_delete'
  get '/appointments/:id/confirm_delete', to: 'appointments#confirm_delete', as: 'confirm_appointment_delete'
  get '/casting_offices/:id/confirm_delete', to: 'casting_offices#confirm_delete', as: 'confirm_casting_office_delete'
  get '/bookings/:id/confirm_delete', to: 'bookings#confirm_delete', as: 'confirm_booking_delete'
  get '/users/:id/confirm_delete', to: 'users#confirm_delete', as: 'confirm_user_delete'
  get '/users/:id/permissions', to: 'users#permissions', as: 'edit_user_permissions'
  #get '/users/registrations/agency_for_facebook', to: 'users/registrations#agency_for_facebook', as: 'agency_for_facebook'
  #get '/users/registrations/facebook_new', to: 'users/registrations#facebook_new', as: 'facebook_user_registration' 
  resources :casting_offices
  resources :bookings
  resources :users
  resources :appointments, only: [:index, :new, :create, :show, :edit]
  
  

end
