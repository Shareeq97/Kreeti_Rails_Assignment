class User < ApplicationRecord

	validates :name,:email,:phone_number, presence: true

	validates :name,:email,:phone_number, uniqueness: true

	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

	def self.csv
		users = User.order("name").limit(50)
		attributes = %w{name email phone_number} 

		CSV.generate do |csv|
     	
	     	csv << attributes

	      	users.each do |user|
	        	csv << attributes.map{ |attr| user.send(attr) }
	      	end
		end
	end
end