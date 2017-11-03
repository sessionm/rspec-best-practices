class CreateSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :systems do |t|
      t.string :slug
      t.string :formal_name

      t.timestamps
    end
  end
end
