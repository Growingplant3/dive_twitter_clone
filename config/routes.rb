Rails.application.routes.draw do
  resources :tweets do
    post :confirm, on: :collection
  end
  root to: 'tweets#index'
end
