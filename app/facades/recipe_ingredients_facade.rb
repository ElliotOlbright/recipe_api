class RecipeIngredientsFacade 
  def self.create_recipe_ingredients(recipe,ingredients)
    ing = ingredients.map do |ingredient| 
      Ingredient.create!(
        name: ingredient)
    end 

    ing.each do |ingredient|
      RecipeIngredient.create(
        recipe_id: recipe.id,
        ingredient_id: ingredient.id
    )
    end 
  end 
end 