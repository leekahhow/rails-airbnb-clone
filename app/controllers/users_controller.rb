class UsersController < ApplicationController
  def show
    @user = current_user
    @pet = @user.pets
<<<<<<< HEAD
    @reviews = Review.where(:reviewable => @user)
=======
    @reviews = Review.all
>>>>>>> 0d833290d27d87133461d9a35adbfc4573ba56e3
  end
end
