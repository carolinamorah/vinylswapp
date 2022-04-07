class Offer < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :offeredvinyl, class_name: "Vinyl", foreign_key: :offeredvinyl_id
  belongs_to :receivervinyl, class_name: "Vinyl", foreign_key: :vinyl_id
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :user, class_name: 'User', foreign_key: :owner_id

  enum offer_state: [:pending, :accepted, :rejected]

  validates_uniqueness_of :offeredvinyl_id, :scope => :vinyl_id

  def get_owner_name
    
  end

end
