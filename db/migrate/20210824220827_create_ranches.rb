class CreateRanches < ActiveRecord::Migration[5.2]
  def change
    create_table :ranches do |t|
      t.string :name
      t.integer :max_capacity
      t.boolean :certified_humane

      t.timestamps
    end
  end
end
