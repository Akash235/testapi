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



      # to create update and delete the userAddresses by user id 
      post :'UserAddress', to: "user_addresses#create"
      put :'UserAddress/:id', to: "user_addresses#update"
      delete :'UserAddress/:id', to: "user_addresses#destroy"
      get :'UserAddress/:id', to: "user_addresses#show"

      # to create update and delete the order by user id 
      post :'Order', to: "orders#create"
      put :'Order/:id', to: "orders#update"
      delete :'Order/:id', to: "orders#destroy"
      get :'Order/:id', to: "orders#show"

      # to create update and delete the Vehicle by user id 
      post :'VehicleModel', to: "vehicle_model#create"
      put :'VehicleModel/:id', to: "vehicle_model#update"
      delete :'VehicleModel/:id', to: "vehicle_model#destroy"
      get :'VehicleModel/:id', to: "vehicle_model#show"


      # to create update and delete the VehicleRentalDetails by user id 
      post :'VehicleRentalDetail', to: "vehicle_rental_details#create"
      put :'VehicleRentalDetail/:id', to: "vehicle_rental_details#update"
      delete :'VehicleRentalDetail/:id', to: "vehicle_rental_details#destroy"
      get :'VehicleRentalDetail/:id', to: "vehicle_rental_details#show"


      # to create update and delete the Vehicle by user id 
      post :'Vehicle', to: "vehicles#create"
      put :'Vehicle/:id', to: "vehicles#update"
      delete :'Vehicle/:id', to: "vehicles#destroy"
      get :'Vehicle/:id', to: "vehicles#show"


      # to create update and delete the Coupon by user id 
      post :'Coupon', to: "coupons#create"
      put :'Coupon/:id', to: "coupons#update"
      delete :'Coupon/:id', to: "coupons#destroy"
      get :'Coupon/:id', to: "coupons#show"


      # to create update and delete the Sheduled ride details by user id 
      post :'ScheduledRideDetail', to: "scheduled_ride_details#create"
      put :'ScheduledRideDetail/:id', to: "scheduled_ride_details#update"
      delete :'ScheduledRideDetail/:id', to: "scheduled_ride_details#destroy"
      get :'ScheduledRideDetail/:id', to: "scheduled_ride_details#show"


      # to create update and delete the Sheduled ride details by user id 
      post :'Decoration', to: "decorations#create"
      put :'Decoration/:id', to: "decorations#update"
      delete :'Decoration/:id', to: "decorations#destroy"
      get :'Decoration/:id', to: "decorations#show"


      # to create update and delete the Invoice by user id 
      post :'Invoice', to: "invoices#create"
      put :'Invoice/:id', to: "invoices#update"
      delete :'Invoice/:id', to: "invoices#destroy"
      get :'Invoice/:id', to: "invoices#show"




      resources :user_details do
        resources :recordings
      end
    end
  end

  resources :user_details
end
