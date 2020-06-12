class PetsController < ApplicationController
  include PgSearch::Model

  def index
    # if params[:query].present?
    #   @pets = Pet.where("name ILIKE ?", "%#{params[:query]}%")
    # else
    #   @pets = Pet.all
    # end

    if params[:query].present?
      sql_query = " \ categories.animal_type ILIKE :query \ "
      @pets = Pet.joins(:category).where(sql_query, query: "%#{params[:query]}%")
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

end
