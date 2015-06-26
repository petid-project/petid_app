class User < ActiveRecord::Base
  has_many :pets
  has_many :reports

  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 8}, confirmation: true

  def self.create_from_omniauth(params)
    attributes = {
      email: params['info']['email'],
      password: Devise.friendly_token,
      name: params['info']['name'],
    }

    create(attributes)
  end

  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :omniauth_providers => [:facebook]

  def is user
    self == user
  end

  def first_name
    return name.split(' ')[0] if name      
  end
  
end
