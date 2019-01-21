class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(:quantity=> "quantity")
    @recipe.ingredients.build(:name=> "name")

  end

  def create
    @recipe = Recipe.create(receipe_params)
    redirect_to recipe_path
  end

  def receipe_params
    params.require(:recipe).permit(:title, :ingredient => [:0_name, :0_quantity, :1_name, :1_quantity])
  end



end
