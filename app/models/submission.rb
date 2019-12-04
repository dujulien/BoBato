class Submission < ApplicationRecord
	belongs_to :convoy
	belongs_to :skipper, class_name: "User"
end
