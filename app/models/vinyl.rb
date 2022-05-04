class Vinyl < ApplicationRecord
  belongs_to :user
  has_many :category_vinyls
  has_many :offers, dependent: :destroy
  has_many :categories, through: :category_vinyls
  has_one_attached :image

  accepts_nested_attributes_for :category_vinyls

  enum status: [:available, :swapped]

  paginates_per 12

  validates :title, :author, :description, :status, :image, presence: true
  validates :description, length: {maximum: 300, too_long: "%#{count} exceeds the character limit."}
 
end

