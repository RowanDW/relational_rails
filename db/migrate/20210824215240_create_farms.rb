class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name
      t.integer :acres
      t.boolean :organic

      t.timestamps
    end
  end
end
