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
    params.require(:recipe).permit(:title, :ingredient => [:name_0, :quanity_0, :name_1, :quantity_1])
  end



end
