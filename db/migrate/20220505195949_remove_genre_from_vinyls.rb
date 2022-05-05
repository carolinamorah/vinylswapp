class RemoveGenreFromVinyls < ActiveRecord::Migration[5.2]
  def change
    remove_column :vinyls, :genre, :string
  end
end
