class UsersController < ApplicationController

	def search
		
		regexp = Regexp.new(params[:search],"i")

		@results = []

		User.all.each do |user|

			if user.name.match(regexp) || user.email == params[:search]
				@results<<user
			end
		end
		@users = User.all
		render "index"
	end


	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
		else
			render "new"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update

		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render "edit"
		end
	end

	def destroy
		@user = User.find(params[:id])

		@user.destroy

		redirect_to users_path
	end

	private

	def user_params
		params.require(:user).permit(:name,:email,:phone_number)
	end

end