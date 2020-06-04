class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def cancel
    @booking = booking.find(params[:id])
    @booking.status = "cancelled"
    @booking.update(status_params)
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :start_time, :end_date)
  end

  def status_params
    params.require(:booking).permit(:status)
  end

end
