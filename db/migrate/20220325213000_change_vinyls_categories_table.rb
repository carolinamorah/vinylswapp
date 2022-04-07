class ChangeVinylsCategoriesTable < ActiveRecord::Migration[5.2]
  def change
    rename_table 'categories_vinyls', 'category_vinyls'
    add_column :category_vinyls, :id, :primary_key
  end
end
