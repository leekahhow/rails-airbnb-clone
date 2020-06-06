class BookingsController < ApplicationController


  def new
    # Initiate new Booking Instance
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
    @booking.pet = @pet
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.pet_id = params[:pet_id]
    @booking.status = "pending"

    if @booking.save
      redirect_to user_bookings_path(@booking.user_id)
    else
      render :new
    end

  end

  #Bookings have an :user_id, :ped_id, :id, :start_date, :hours, :status,


  def cancel
    @booking = booking.find(params[:id])
    @booking.status = "cancelled"
    @booking.update(status_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:pet_id, :start_date, :hours)
  end

  def status_params
    params.require(:booking).permit(:status)
  end

end
