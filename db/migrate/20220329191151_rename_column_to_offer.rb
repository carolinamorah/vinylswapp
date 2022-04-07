class RenameColumnToOffer < ActiveRecord::Migration[5.2]
  def change
    rename_column :offers, :receivervinyl_id, :vinyl_id
  end
end
