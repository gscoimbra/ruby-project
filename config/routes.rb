Rails.application.routes.draw do
  resources :chair_orders, only: [:create]
  get 'availability', to: 'chair_orders#availability'
end
