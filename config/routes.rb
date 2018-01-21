Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :confirm_email
    end
  end

  namespace :api do
    namespace :v1 do
      post :auth, to: "authentication#create"

      resources :user_details do
        resources :recordings
      end
    end
  end

  resources :user_details
end
