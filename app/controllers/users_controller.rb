class UsersController < ApplicationController
  def show
    @user = current_user
    @pet = @user.pets
    @reviews = Review.where(:reviewable == @current_user)
  end
end
