class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :create_profile       

  after_create :welcome_send
  has_many :convoys, foreign_key: 'convoy_id', class_name: "Convoy"
  has_many :submissions, foreign_key: 'submission_id', class_name: "Submission"
  has_many :deliveries, foreign_key: 'submission_id', class_name: "Submission"
  has_one :profile

 	def welcome_send
    UserMailer.welcome_boatowner_email(self).deliver_now
  end

end
