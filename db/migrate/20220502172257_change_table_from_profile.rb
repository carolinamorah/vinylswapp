class ChangeTableFromProfile < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :city, :municipality
  end
end
