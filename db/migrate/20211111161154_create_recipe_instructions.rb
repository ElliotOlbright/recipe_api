class CreateRecipeInstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_instructions do |t|
      t.references :recipe, foreign_key: true
      t.references :instruction, foreign_key: true
    end
  end
end
