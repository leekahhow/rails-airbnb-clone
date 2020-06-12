class UsersController < ApplicationController
  def show
    @user = current_user
    @pet = @user.pets
    #list of reviews tagged under the user
    @reviews = Review.where(:reviewable => @user)
    #list of users
    users_id = @reviews.pluck(:reviewable_id)
    @users_who_left_reviews = User.where(id: users_id)
  end
end
