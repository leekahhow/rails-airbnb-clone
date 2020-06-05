class BookingsController < ApplicationController

  def new
    # Initiate new Booking Instance
    @booking = Booking.new
  end

  def create
    # Pass booking details to new booking instance
    @booking = Booking.new(booking_params)
    # Pass User id to new booking instance
    @user = User.find(params[:user_id])
    # Chaning the status = valid of new booking instance
    @booking.status = "valid"
    # If/Else Save
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  #Bookings have an :id, :user_id, :start_date, :hours, :status, :ped_id


  def cancel
    @booking = booking.find(params[:id])
    @booking.status = "cancelled"
    @booking.update(status_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :hours)
  end

  def status_params
    params.require(:booking).permit(:status)
  end

end
