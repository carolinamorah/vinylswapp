class Message < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :content, presence: true, length: { in: 1..240 }
  validates :subject, presence: true
end
