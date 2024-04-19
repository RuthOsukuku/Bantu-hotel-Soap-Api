Rails.application.routes.draw do
  resources :rooms
  resources :clients
  resources :bookings
end
