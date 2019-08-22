class HomeController < ApplicationController

	require 'csv'

	def index
	end

	def csv
		send_data User.csv, filename: "users.csv"
	end

	def pdf
		send_data Employee.pdf.render, filename: "employees.pdf"
	end

	def mail
		StudentMailer.send_mail.deliver 
		redirect_to root_path
	end

	def uploading
		redirect_to image_index		
	end

end