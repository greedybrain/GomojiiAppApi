Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do 
    namespace :v1 do 
      root "users#home"

      resources :users do
        resources :emojis, only: [:create, :destroy]
      end

      resources :emojis, only: [:index, :show]

      post :signup, to: "registrations#signup"
      get :login_check, to: "sessions#login_check"
      post :login, to: "sessions#login"
      delete :logout, to: "sessions#logout"
    end
  end

end
