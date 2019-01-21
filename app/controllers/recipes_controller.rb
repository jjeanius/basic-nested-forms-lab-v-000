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
  endattribute_1_

  def receipe_params
    params.require(:recipe).permit(:title, :ingredient => [:attributes_0_name, :attributes_0_quantity, :attributes_1_name, :attributes_1_quantity])
  end



end
