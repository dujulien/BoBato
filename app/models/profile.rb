class Profile < ApplicationRecord
	has_one_attached :avatar
	belongs_to :user



	has_many :user_feedbacks


	def avatar_attachment_path
    self.avatar.attached? ? avatar : 'no-avatar.png'
  end


end
