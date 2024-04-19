Rails.application.routes.draw do
  resources :rooms
  resources :clients
  resources :bookings do
    collection do
      get :get_available_rooms
      get :get_booking_confirmation
    end
  end
end
