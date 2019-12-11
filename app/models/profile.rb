class Profile < ApplicationRecord
	has_one_attached :avatar
	belongs_to :user


	has_many :user_feedbacks

end
