class CreatePlanets < ActiveRecord::Migration[5.1]
  def change
    create_table :planets do |t|
      t.string :proper_name
      t.string :slug
      t.float :mass
      t.references :solar_system, foreign_key: true

      t.timestamps
    end
    add_index :planets, :proper_name, unique: true
    add_index :planets, :slug, unique: true
  end
end
