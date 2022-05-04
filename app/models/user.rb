class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :user_ids, class_name: 'Offer', foreign_key: :user_id, dependent: :destroy
  has_many :owner_ids, class_name: 'Offer', foreign_key: :owner_id, dependent: :destroy
  has_many :vinyls, dependent: :destroy
  has_many :offers, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :collectionist_name, :email, presence: true
  #validates :email, uniqueness: true
  has_one :profile, dependent: :destroy
  acts_as_voter
  
  enum role: [:collectionist, :admin]

  after_create :set_profile

  def set_profile
    self.profile = Profile.create(city:'Santiago', state:'Región Metropolitana')
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      
    end
  end

  # def self.from_omniauth(access_token)
  #   data= access_token.info
  #   user= User.where(email: data['email']).first
  #   unless user
  #     user= User.create(
  #       email: data['email'],
  #       password: Devise.friendly_token(0, 20)
  #     )
  #   end
  #   user
  # end
  

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: provider_data.uid).first_or_create  do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #   end
  # end
   
end
