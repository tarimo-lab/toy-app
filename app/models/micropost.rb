class Micropost < ApplicationRecord
	belongs_to :user
	validates :content, length: {maximum: 140}, presence: true


	def details
		"By #{self.user.name} on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
	end
end
