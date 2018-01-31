Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :confirm_email
    end
  end

  namespace :api do
    namespace :v1 do
      post :'auth/token', to: "authentication#create"
      post :'auth/logout', to: "authentication#destroy"
      get :'auth/permissions', to: "permission#show"
      put :'ChangePassword', to: "password#update"
      get :'auth/currentusername', to: "authentication#show"
      get :'Users',  to: "users#show"

      get :'User', to: "user_details#show"
      # to create update and delete the order by user id 
      post :'Order', to: "orders#create"
      put :'Order/:id', to: "orders#update"
      delete :'Order/:id', to: "orders#destroy"
      get :'Order/:id', to: "orders#show"

      resources :user_details do
        resources :recordings
      end
    end
  end

  resources :user_details
end
