class ChangeUserForOffers < ActiveRecord::Migration[5.2]
  def change
    add_reference :offers, :owner, references: :users, index: true
  end
end
