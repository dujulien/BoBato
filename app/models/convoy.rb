class Convoy < ApplicationRecord
	belongs_to :boat_owner
	has_one :delivery
	has_many :applications
	has_many :applicants, through: :applications, :source => :skipper
end
