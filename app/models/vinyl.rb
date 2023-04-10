class Vinyl < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_and_belongs_to_many :categories
  has_one_attached :image

  enum status: [:available, :swapped]

  paginates_per 12

  validates :title, :author, :description, :status, presence: true
  validate :image_attached
  validate :description_length

  private

  def image_attached
    unless image.attached?
      errors.add(:image, "must be attached")
    end
  end

  def description_length
    if description.present? && description.length > 300
      errors.add(:description, "exceeds the character limit (300)")
    end
  end

end

