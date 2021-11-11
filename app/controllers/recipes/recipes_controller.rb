class Recipes::RecipesController < ApplicationController
  def create  
    ingredients = params[:ingredients]
    instructions = params[:instructions]
    
    ing = ingredients.map do |ingredient| 
      Ingredient.create!(
        name: ingredient)
    end 

    inst = instructions.map do |instruction| 
      Instruction.create!(
        name: instruction
      )
    end


    recipe = Recipe.new(
      name: params[:name],
    )
    existing_recipe =  Recipe.find_by(name: params[:name])
 
    if existing_recipe.nil?
      recipe.save

      ing.each do |ingredient|
        RecipeIngredient.create(
          recipe_id: recipe.id,
          ingredient_id: ingredient.id
      )
      end   
  
      inst.each do |instruction|
        RecipeInstruction.create(
          recipe_id: recipe.id,
          instruction_id: instruction.id
      )
      end  
  
      render json: RecipeSerializer.create_recipe(recipe), status: :created
    else 
      render json: { error: "Recipe already exists"}, status: 400
    end 
  end 

  def index
    recipes = Recipe.all 
    render json: RecipeSerializer.get_recipes(recipes)
  end 

  def update 
    recipe = Recipe.find_by(name: params[:name])
    if !recipe.nil?
      recipe.update(
        name: params[:name],
        ingredient: params[:ingredients]
      )
    else 
      render json: { error: "Recipe does not exist"}, status: 400
    end
  end 
end 