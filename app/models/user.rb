class User < ApplicationRecord
	has_many :microposts, dependent: :destroy	# if a user is deleted, also delete their microposts
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 250 },
				format: {with: VALID_EMAIL_REGEX },
				#uniqueness: true
				uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }



	def details
		"Joined on #{self.created_at.strftime("%m/%d/%Y at %H:%M")}"
	end

end
