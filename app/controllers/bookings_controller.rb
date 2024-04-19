class BookingsController < ApplicationController
    def index
      bookings = Booking.all
      render json: bookings
    end
  
    def show
      booking = Booking.find(params[:id])
      render json: booking
    end
  
    def create
      booking = Booking.new(booking_params)
  
      if booking.save
        render json: booking, status: :created
      else
        render json: booking.errors, status: :unprocessable_entity
      end
    end
  
    def update
      booking = Booking.find(params[:id])
  
      if booking.update(booking_params)
        render json: booking
      else
        render json: booking.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      booking = Booking.find(params[:id])
      booking.destroy
    end
  
    def get_available_rooms
      available_rooms = Room.where(availability: true)
      render json: available_rooms
    end
  
    def get_booking_confirmation
      booking = Booking.find(params[:id])
      total_amount = booking.room.price_per_night * booking.number_of_rooms
      confirmation_data = {
        booking_id: booking.id,
        room_id: booking.room.id,
        client_id: booking.client.id,
        check_in_date: booking.check_in_date,
        number_of_rooms: booking.number_of_rooms,
        total_amount: total_amount
      }
      render json: confirmation_data
    end
  
    private
  
    def booking_params
      params.require(:booking).permit(:room_id, :client_id, :check_in_date, :number_of_rooms)
    end
  end
  
  #
    # Other actions
  
    def get_available_rooms
      available_rooms = Room.where(availability: true)
      render json: available_rooms
    end
  
    def get_booking_confirmation
      booking = Booking.find(params[:id])
      total_amount = booking.room.price_per_night * booking.number_of_rooms
      confirmation_data = {
        booking_id: booking.id,
        room_id: booking.room.id,
        client_id: booking.client.id,
        check_in_date: booking.check_in_date,
        number_of_rooms: booking.number_of_rooms,
        total_amount: total_amount
      }
      render json: confirmation_data
    end
  end
  