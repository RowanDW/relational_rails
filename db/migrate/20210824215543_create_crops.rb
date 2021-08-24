class CreateCrops < ActiveRecord::Migration[5.2]
  def change
    create_table :crops do |t|
      t.string :name
      t.integer :yield
      t.boolean :annual
      t.references :farms, foreign_key: true

      t.timestamps
    end
  end
end
