class Delivery < ApplicationRecord
	belongs_to :skipper, class_name: 'User'
	belongs_to :convoy
end
