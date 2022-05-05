class Vinyl < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_and_belongs_to_many :categories
  has_one_attached :image

  enum status: [:available, :swapped]

  paginates_per 12

  validates :title, :author, :description, :status, :image, presence: true
  validates :description, length: {maximum: 300, too_long: "%#{count} exceeds the character limit."}
 
end

