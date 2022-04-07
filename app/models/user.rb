class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_ids, class_name: 'Offer', foreign_key: :user_id
  has_many :owner_ids, class_name: 'Offer', foreign_key: :owner_id
  has_many :vinyls, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :messages, dependent: :destroy

  enum role: [:collectionist, :admin]

end
