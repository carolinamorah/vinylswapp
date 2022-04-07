class CreateJoinTableVinylCategory < ActiveRecord::Migration[5.2]
  def change
    create_join_table :vinyls, :categories do |t|
      t.index [:vinyl_id, :category_id]
      t.index [:category_id, :vinyl_id]
    end
  end
end
