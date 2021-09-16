Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :customer, only: [:create] do
        resources :subscriptions, only: [:create]
      end
      resources :teas, only: [:create]
    end
  end
end
