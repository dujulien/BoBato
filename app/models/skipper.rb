class Skipper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :submissions
  has_many :deliveries

  has_one_attached :avatar_skipper

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_skipper_email(self).deliver_now
  end
  
end
