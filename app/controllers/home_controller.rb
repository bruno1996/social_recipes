class HomeController < ApplicationController
  def index
    @recipes = Recipe.all
    @kitchens = Kitchen.all
  end
end
