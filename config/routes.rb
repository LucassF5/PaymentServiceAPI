Rails.application.routes.draw do
  resources :payments, only: [:index, :create]
end
