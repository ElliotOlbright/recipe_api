class RecipeSerializer
  def self.create_recipe(recipe)
    {
      "name": recipe.name,
      "ingredients": recipe.ingredients.pluck(:name),
      "instructions": recipe.instructions.pluck(:name)
    }
  end 

  def self.get_recipes(recipes)
    {
      "recipeNames": recipes.map(&:name)
    }
  end

  def self.get_details(recipe)
    {
      "details":
        {
          "ingredients": recipe.ingredients.pluck(:name) ,
          "numSteps":recipe.ingredients.count
        }
    }
  end 
end