class CreateStars < ActiveRecord::Migration[5.1]
  def change
    create_table :stars do |t|
      t.string :slug
      t.float :mass
      t.string :formal_name

      t.timestamps
    end
  end
end
