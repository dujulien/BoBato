class BoatOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar_boat_owner
  
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_boatowner_email(self).deliver_now
  end

end
