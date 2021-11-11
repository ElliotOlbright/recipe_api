class Recipes::DetailsController < ApplicationController
  def show 
    recipe = Recipe.find_by(name: params[:id])
    if !recipe.nil?
      render json: RecipeSerializer.get_details(recipe)
    else
      render json: {}, status: 200
    end
  end 
end 