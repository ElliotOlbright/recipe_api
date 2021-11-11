require 'rails_helper'

RSpec.describe 'Subscriptions API' do 
  before :each do
    @recipe = Recipe.create!(
      name: "garlicBread"
    )

    @ingredient = Ingredient.create!(
      name: "garlic"
    )

    @instruction = Instruction.create!(
      name: "smash garlic"
    )

    @r_ing = RecipeIngredient.create!(
      ingredient_id: @ingredient.id,
      recipe_id: @recipe.id
    )

    @r_ints = RecipeInstruction.create!(
      instruction_id: @instruction.id,
      recipe_id: @recipe.id
    )
  
  end

  it 'can create a recipe' do 
    body = {
        "name": "butteredBagel", 
          "ingredients": [
            "1 bagel", 
            "butter"
          ], 
        "instructions": [
          "cut the bagel", 
          "spread butter on bagel"
        ]
    }

    post "/recipes", params: body, as: :json

    expect(response).to be_successful
    expect(response.status).to eq (201)

    recipe = JSON.parse(response.body, symbolize_names: true)

    expect(recipe).to have_key(:name)
    expect(recipe[:name]).to be_a(String)

    expect(recipe).to have_key(:ingredients)
    expect(recipe[:ingredients]).to be_a(Array)
    expect(recipe[:ingredients].count).to eq(2)

    expect(recipe).to have_key(:instructions)
    expect(recipe[:instructions]).to be_a(Array)
    expect(recipe[:instructions].count).to eq(2)
  end 

  it 'can return error if recipe already exists' do 
    body = {
        "name": "garlicBread", 
          "ingredients": [
            "garlic"
          ], 
        "instructions": [
          "smash garlic"
        ]
    }

    post "/recipes", params: body, as: :json

    expect(response).to_not be_successful
    expect(response.status).to eq (400)

    recipe = JSON.parse(response.body, symbolize_names: true)
  end 
end 