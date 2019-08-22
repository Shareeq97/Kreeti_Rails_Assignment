class StudentMailer < ApplicationMailer

	def send_mail
    	mail(to: "shareeqali1997@gmail.com", subject: 'A mail from rails Assignment')
  	end


end
