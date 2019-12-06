class Delivery < ApplicationRecord
	belongs_to :skipper, class_name: 'User'
	belongs_to :convoy

	validate :skipper_must_be_available_for_this_convoy


	def skipper_must_be_available_for_this_convoy
	  errors.add(:skipper_id, "Le skipper choisi n'est pas disponible pour les dates selectionnées") unless check_skipper_availability
	end


end
