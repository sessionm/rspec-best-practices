class CreatePlanets < ActiveRecord::Migration[5.1]
  def change
    create_table :planets do |t|
      t.string :formal_name
      t.string :slug
      t.string :system
      t.string :mass
      t.references :planet_type

      t.timestamps
    end
  end
end
