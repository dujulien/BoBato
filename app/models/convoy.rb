class Convoy < ApplicationRecord
	belongs_to :boat_owner
	has_one :delivery
	has_many :submissions
	has_many :applicants, through: :submissions, :source => :skipper
end
