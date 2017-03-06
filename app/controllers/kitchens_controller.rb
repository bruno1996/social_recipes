class KitchensController < ApplicationController
  def index
    @kitchens = Kitchen.all
    @recipes = Recipe.all
  end
  def new
    @kitchen = Kitchen.new
    @recipes = Recipe.all
  end
  def create
    @kitchen = Kitchen.new
    @recipes = Recipe.all
    @kitchen.name = params[:kitchen][:name]
    if @kitchen.save
      redirect_to @kitchen
    else
      flash[:error] = 'PREENCHA O NOME DA COZINHA'
      render :new
    end
  end
  def show
    @recipes = Recipe.all
    @kitchen = Kitchen.find params[:id]
  end
end
