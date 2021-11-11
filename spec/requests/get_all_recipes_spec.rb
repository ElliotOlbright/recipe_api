require 'rails_helper'

RSpec.describe 'Subscriptions API' do 
  before :each do
    @recipe = Recipe.create!(
      name: "garlic pasta"
    )

    @recipe2 = Recipe.create!(
      name: "Spaghetti Carbonara"
    )

    @recipe3 = Recipe.create!(
      name: "Jimmies Hot Dogs"
    )

    @recipe4 = Recipe.create!(
      name: "Tonys Brocolli"
    )
   
  end

  it 'can create a recipe' do 

    get "/recipes"

    expect(response).to be_successful
    expect(response.status).to eq (200)

    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(recipes).to have_key(:recipeNames)
    expect(recipes[:recipeNames]).to be_an(Array)
    expect(recipes[:recipeNames].count).to eq(4)
  end 
end 