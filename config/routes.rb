Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create] do
        resources :subscriptions, only: [:index, :update]
        resources :subscriptions, only: [:create], as: :new_subscriptions
      end
      resources :teas, only: [:create]
    end
  end
end
