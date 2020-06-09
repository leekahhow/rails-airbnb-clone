class ReviewsController < ApplicationController
  def new
    @review = Review.new
    if params[:user_id]
      @review.reviewable = User.find(params[:user_id])
    else
      @review.reviewable = Booking.find(params[:booking_id])
    end
  end

  def create
    raise
    @review = Review.new(review_params)
    if params[:user_id]
      @review.reviewable = User.find(params[:user_id])
    else
      @review.reviewable = Booking.find(params[:booking_id])
    end

    if @review.save
      redirect_to user_bookings_path(current_user.id)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end


end
