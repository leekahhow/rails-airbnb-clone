class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    @pet = Pet.find(@bookings.last.pet_id)
  end

  def new
    # Initiate new Booking Instance
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
    @booking.pet = @pet
  end

  def show
    @booking = Booking.find(params[:id])
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.pet_id = params[:pet_id]
    @booking.status = "pending"

    if @booking.save
      redirect_to user_booking_path(@booking.user_id, @booking.id)
    else
      render :new
    end

  end


  def cancel
    @booking = Booking.find(params[:id])
    @booking.status = "cancelled"
    @booking.save
    redirect_to user_booking_path(@booking), notice: "Booking cancelled"
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    @booking.save
    redirect_to user_booking_path(@booking)
  end


  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "declined"
    @booking.save
    redirect_to user_booking_path(@booking)
  end


  private

  def booking_params
    params.require(:booking).permit(:pet_id, :start_date, :hours)
  end

  # def status_params
  #   params.require(:booking).permit(:status)
  # end

end
