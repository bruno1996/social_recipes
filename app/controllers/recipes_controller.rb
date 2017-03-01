class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end
  def show
    @recipe = Recipe.find params[:id]
  end
  def new
    @recipe = Recipe.new
  end
  def create
    recipe_params = params.require(:recipe).permit(:recipe_name,:kitchen,:type_of_food,:how_many_people_serves,:preparation_time,:difficulty_level,:ingredients,:step_by_step)
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash[:error] = 'PREENCHA OS CAMPOS EM BRANCO'
      render :new
    end
  end
end
