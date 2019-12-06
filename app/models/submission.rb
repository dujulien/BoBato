class Submission < ApplicationRecord
	belongs_to :convoy
	belongs_to :skipper, class_name: "User"

	validate :skipper_must_be_available_before_submit


	def skipper_must_be_available_before_submit
	  errors.add(:skipper_id, "Vous ne pouvez pas participer à ce convoi car vous êtes déjà engagé sur un autre convoi aux même dates") unless check_skipper_availability
	end


end
