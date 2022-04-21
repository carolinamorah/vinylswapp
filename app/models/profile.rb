class Profile < ApplicationRecord
  acts_as_votable
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

  paginates_per 8
end
