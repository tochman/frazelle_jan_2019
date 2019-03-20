class StaffContent::ArticlesController < ApplicationController
	before_action :check_staff_auth
	def index
	end

	private

	def check_staff_auth
		if user_signed_in? && (current_user.role != "journalist" || current_user.role !="editor")
			redirect_to root_path
		end
	end
end
