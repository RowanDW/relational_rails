class CreateCows < ActiveRecord::Migration[5.2]
  def change
    create_table :cows do |t|
      t.string :name
      t.integer :age
      t.boolean :grass_fed
      t.references :ranches, foreign_key: true

      t.timestamps
    end
  end
end
