class Student < ApplicationRecord

	validates :name,:email,:phone_number, presence: true

	validates :name,:email,:phone_number, uniqueness: true

	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	
end
