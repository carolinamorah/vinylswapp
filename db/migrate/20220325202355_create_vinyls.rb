class CreateVinyls < ActiveRecord::Migration[5.2]
  def change
    create_table :vinyls do |t|
      t.string :title
      t.string :author
      t.date :released_date
      t.string :format
      t.text :description
      t.integer :status, default: 0
      t.references :user, foreign_key: true
      t.string :genre, array: true, default: []

      t.timestamps
    end
  end
end
