class BookingsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @bookings = @user.bookings
    @pet = @user.pets
    #list of user pets ids
    user_pets = @user.pets.pluck(:id)
    #all the bookings for this .pluck
    bookings = Booking.where(pet_id: user_pets)
    #list of users who booked my pets
    users_id = bookings.pluck(:user_id)
    #get the users
    @users_who_booked_user_pets = User.where(id: users_id )
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
      redirect_to user_bookings_path(@booking.user_id, @booking.id)
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
    @booking.status = "approved"
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
