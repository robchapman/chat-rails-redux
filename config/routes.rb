Rails.application.routes.draw do
  # Devise
  devise_for :users
  # Internal API
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, only: [] do
        resources :messages, only: [ :index, :create ]
      end
    end
  end
  # Actual pages for use
  resources :channels, only: [ :show ]
  root to: 'channels#show'
end
