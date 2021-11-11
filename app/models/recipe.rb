class Recipe < ApplicationRecord 
  has_many :recipe_ingredients 
  has_many :recipe_instructions
  has_many :ingredients, through: :recipe_ingredients
  has_many :instructions, through: :recipe_instructions

  validates :name, uniqueness: true
end 