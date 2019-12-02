class Delivery < ApplicationRecord
	belongs_to :skipper
	belongs_to :convoy
end
