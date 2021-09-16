Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create]
      resources :subscriptions, only: [:create, :update]
      resources :teas, only: [:create]
    end
  end
end
