require 'rails_helper'

RSpec.describe 'Get Recipe Details' do 
  before :each do
    @recipe = Recipe.create!(
      name: "garlicPasta"
    )

    @ingredient = Ingredient.create!(
      name: "cheese",
    )
    @ingredient2 = Ingredient.create!(
      name: "garlic"
    
    )
    @ingredient3 = Ingredient.create!(
      name: "pasta"
    )

    @instruction = Instruction.create!(
      name: "smash garlic"
    )

    @r_ing = RecipeIngredient.create!(
      ingredient_id: @ingredient.id,
      recipe_id: @recipe.id
    )
    @r_ing2 = RecipeIngredient.create!(
      ingredient_id: @ingredient2.id,
      recipe_id: @recipe.id
    )
    @r_ing3 = RecipeIngredient.create!(
      ingredient_id: @ingredient3.id,
      recipe_id: @recipe.id
    )

    @r_ints = RecipeInstruction.create!(
      instruction_id: @instruction.id,
      recipe_id: @recipe.id
    )
   
  end

  it 'can get update recipe details' do 

    body = {
      "name": "garlicPasta", 
        "ingredients": [
          "cheesy cheese", 
          "garlic",
          "pasta"
        ], 
      "instructions": [
        "eat cheese", 
        "smoosh garlic"
      ] 
    }

    put "/recipes", params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq (200)

    recipe = JSON.parse(response.body, symbolize_names: true)

    expect(recipe).to have_key(:details)
    expect(recipe[:details]).to have_key(:ingredients)
    expect(recipe[:details][:ingredients]).to be_an(Array)
    expect(recipe[:details][:ingredients].count).to eq(3)

    expect(recipe[:details]).to have_key(:numSteps)
    expect(recipe[:details][:numSteps]).to be_an(Integer)
  end 
end 