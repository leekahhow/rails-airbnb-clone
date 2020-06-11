class UsersController < ApplicationController
  def show
    @user= User.find(params[:id])
    @reviews = Review.where(:reviewable_id == :id)
    @pets= Pet.where(:user_id == :id)
  end
end
