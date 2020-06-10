class PetsController < ApplicationController
  include PgSearch::Model

  def index
    @pets = Pet.all
    @pet_search = Pet.search_by_name(params[:query])
  end

  def show
    @pet = Pet.find(params[:id])
    @reviews = Review.where(:reviewable_id == :pet_id)
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
    authorize @pet
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
    authorize @pet
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, notice: "Pet deleted"
    authorize @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :price_per_hour, :category_id, :photo)
  end

end
