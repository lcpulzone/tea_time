Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create] do
        resources :subscriptions, only: [:index, :update]
      end
      resources :subscriptions, only: [:create]
      resources :teas, only: [:create]
    end
  end
end
