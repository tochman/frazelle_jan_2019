# frozen_string_literal: true

class ConfirmationsController < Devise::ConfirmationsController
	def show
		self.resource = resource_class.confirm_by_token(params[:confirmation_token])
		yield resource if block_given?

		if resource.sign_in_count == 0
			resource.subscriber!
			sign_in(resource)
			flash[:notice] = "You have to change your password"
			respond_with_navigational(resource){ redirect_to edit_user_registration_path }
		else
			respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
		end
	end
end
