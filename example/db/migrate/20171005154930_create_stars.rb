class CreateStars < ActiveRecord::Migration[5.1]
  def change
    create_table :stars do |t|
      t.string :proper_name
      t.string :slug
      #t.references :, foreign_key: true
      t.string :mass
      t.string :type
      t.references :system, foreign_key: true

      t.timestamps
    end
  end
end
