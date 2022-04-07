class AddConditionToVinylTable < ActiveRecord::Migration[5.2]
  def change
    add_column :vinyls, :condition, :string
  end
end
