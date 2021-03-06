class EmployeesController < ApplicationController
	
	def search
		
		regexp = Regexp.new(params[:search],"i")

		@results = []

		Employee.all.each do |employee|

			if employee.name.match(regexp) || employee.email == params[:search]
				@results<<employee
			end
		end
		@employees = Employee.all
		render "index"
	end


	def index
		@employees = Employee.all
	end

	def new
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)

		if @employee.save
			redirect_to @employee
		else
			render "new"
		end
	end

	def show
		@employee = Employee.find(params[:id])
	end

	def edit
		@employee = Employee.find(params[:id])
	end

	def update

		@employee = Employee.find(params[:id])
		if @employee.update(employee_params)
			redirect_to @employee
		else
			render "edit"
		end
	end

	def destroy
		@employee = Employee.find(params[:id])

		@employee.destroy

		redirect_to employees_path
	end

	private
	def employee_params
		params.require(:employee).permit(:name,:email,:phone_number)
	end
end
