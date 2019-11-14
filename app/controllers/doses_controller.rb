class DosesController < ApplicationController
  #before_action: set_params, only: [:destroy]
  #before_action: dose_params, only: [:create]

 # def index
 #   @doses= Dose.all
 # end

#  def show
 #   @dose = Dose.find(params[:id])
 # end
# end
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
      #@ingredient = ingredient.find(params)
   # @cocktail.dose = @dose
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to dose_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
