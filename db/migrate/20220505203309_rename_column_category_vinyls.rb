class RenameColumnCategoryVinyls < ActiveRecord::Migration[5.2]
  def change
    rename_table 'category_vinyls', 'categories_vinyls'
  end
end
