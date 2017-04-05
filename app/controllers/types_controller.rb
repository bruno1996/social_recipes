class TypesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :show ]

  def index
    @types = Type.all
    @recipes = Recipe.all
  end
  def show
    @type = Type.find params[:id]
  end
  def new
    @recipes = Recipe.all
    @type = Type.new
  end
  def create
    @recipes = Recipe.all
    @type = Type.new
    @type.name = params[:type][:name]
    if @type.save
      redirect_to @type
    else
      flash[:error] = 'PREENCHA O TIPO DE COMIDA'
      render :new
    end
  end
end
