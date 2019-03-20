class EmployeesController < ApplicationController
	before_action :check_staff_auth
	def index
	end

	private

	def check_staff_auth
		if user_signed_in? && current_user.role == "journalist"
		else
			redirect_to root_path
		end
	end
end
