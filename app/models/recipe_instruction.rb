class RecipeInstruction < ApplicationRecord 
  belongs_to :instruction
  belongs_to :recipe
  
end 