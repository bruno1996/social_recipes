class RecipesController < ApplicationController
  def index
    @recipes = Recipe.most_recent.limit(20)
    @kitchens = Kitchen.all
    @types = Type.all
  end
  def show
    @recipe = Recipe.find params[:id]
    @kitchens = Kitchen.all
  end
  def new
    @types = Type.all
    @kitchens = Kitchen.all
    @recipe = Recipe.new
  end
  def create
    @types = Type.all
    @kitchens = Kitchen.all
    recipe_params = params.require(:recipe).permit(:recipe_name,:kitchen_id,:type_id,:how_many_people_serves,
                                                   :preparation_time,:difficulty_level,:ingredients,:step_by_step,:avatar)
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      flash[:error] = 'PREÉNCHA OS CAMPOS EM BRANCO'
      render :new
    end
  end
  def search
    @term = params[:term]
    @recipes = Recipe.where(recipe_name: @term)
  end
end
