class UsersController < ApplicationController
  def show
    @user = current_user
    @pet = @user.pets
    @reviews = Review.all
  end
end
