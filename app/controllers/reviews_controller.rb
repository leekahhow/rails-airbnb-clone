class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.reviewable = @booking
    if @review.save
      redirect_to user_bookings_path(current_user.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating, :reviewable_id)
  end

end
