class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :avatar
      t.string :bio
      t.float :latitude
      t.float :longitude
      t.string :state
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
