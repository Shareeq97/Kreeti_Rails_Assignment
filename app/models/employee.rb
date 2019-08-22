class Employee < ApplicationRecord

	validates :name,:email,:phone_number, presence: true

	validates :name,:email,:phone_number, uniqueness: true

	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	
	def self.pdf
		@employees = Employee.all.order("name").limit(50)

		Prawn::Document.new do |pdf|

			@employees.each do |employee|
				pdf.text "Name: #{employee.name}  Email: #{employee.email} Phone: #{employee.phone_number}" 
			end
		end
	end
end
