class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_profile       

  after_create :welcome_send

  has_one :profile

  has_many :convoys, foreign_key: 'boat_owner_id', class_name: "Convoy"
  has_many :submissions, foreign_key: 'skipper_id', class_name: "Submission"
  has_many :deliveries, foreign_key: 'skipper_id', class_name: "Delivery"

 	def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
