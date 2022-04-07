class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.references :offeredvinyl, foreign_key: {to_table: :vinyls}
      t.references :receivervinyl, foreign_key: {to_table: :vinyls}
      t.integer :offer_state, default: 'pending'
      t.datetime :end_date

      t.timestamps
    end
  end
end
