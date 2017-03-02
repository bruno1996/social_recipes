class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.all
    @recipes = Recipe.all
  end
  def new
    @recipes = Recipe.all
    @Kitchen = Kitchen.new
  end
  def create
    @recipes = Recipe.all
    kitchen_params = params.require(:recipe).permit(:name)
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.save
    redirect_to @kitchen
  end
end
