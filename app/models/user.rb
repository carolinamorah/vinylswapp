class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_ids, class_name: 'Offer', foreign_key: :user_id, dependent: :destroy
  has_many :owner_ids, class_name: 'Offer', foreign_key: :owner_id, dependent: :destroy
  has_many :vinyls, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :messages, dependent: :destroy
  
  has_one :profile, dependent: :destroy
  acts_as_voter
  
  enum role: [:collectionist, :admin]
  
end
