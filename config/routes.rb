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
    member do
      get 'confirm_delete'
    end
    resources :appointments
  end
  
  resources :agencies, only: [:index, :new, :create, :show, :edit] do
    resources :users
  end

  resources :projects do
    collection do
      get 'stage'
      get 'film'
      get 'commercial'
      get 'industrial'
      get 'short'
      get 'new_media'
    end
    member do
      get 'confirm_delete'
    end
    resources :appointments
  end
  
  resources :appointments do
    member do
      get 'confirm_delete'
    end
  end
  
  
  resources :casting_offices do
    member do
      get 'confirm_delete'
    end
  end


  resources :bookings do
    member do
      get 'confirm_delete'
    end
  end


  resources :users do
    member do
      get 'confirm_delete'
    end
  end

  
  get '/users/:id/permissions', to: 'users#permissions', as: 'edit_user_permissions'
  get '/static/privacy_policy', to: 'static#privacy_policy', as: :privacy_policy

end
