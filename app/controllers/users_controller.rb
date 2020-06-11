class UsersController < ApplicationController
  def show
    @user = current_user
    @pet = @user.pets
    @reviews = current_user.reviews
  end
end
