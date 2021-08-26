class ChangeForeignKeyCows < ActiveRecord::Migration[5.2]
  def change
    rename_column :cows, :ranches_id, :ranch_id
  end
end
