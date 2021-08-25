class ChangeForeignKeyPluralNaming < ActiveRecord::Migration[5.2]
  def change
    rename_column :crops, :farms_id, :farm_id
  end
end
