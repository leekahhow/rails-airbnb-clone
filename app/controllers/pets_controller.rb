class PetsController < ApplicationController
  include PgSearch::Model

  def index
    @categories = Category.all
    if params[:animal_type].present?
      @category = Category.find_by_animal_type(params[:animal_type])
      @pets = Pet.all.where(category_id: @category.id)
    else
      @pets = Pet.all
    end

end

  def show
    @user = current_user
    @pet = Pet.find(params[:id])
    @reviews = Review.where(:reviewable => @pet)
    @booking = Booking.find_by pet_id: params[:id]
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user

    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, notice: "Pet deleted"
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :price_per_hour, :category_id, :photo)
  end

  def category_params
    params.require(:category).permit(:photo)
  end


end
