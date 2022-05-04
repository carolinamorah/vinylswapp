class Profile < ApplicationRecord
  acts_as_votable
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  geocoded_by :address
  after_validation :geocode

  def address
    [municipality, state].compact.join(', ')
  end


  paginates_per 8

end
