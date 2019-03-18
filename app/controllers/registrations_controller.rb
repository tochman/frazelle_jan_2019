# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
	before_action :mock_stripe_in_test

	def create
    random_password = [*('a'..'z'), *('0'..'9')].sample(6).join
    build_resource(sign_up_params.merge(password: random_password,
																				temp_password: random_password))

    customer = Stripe::Customer.create(
      email: resource.email,
      source: stripe_token(params),
      description: 'The Hub News subscriber'
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 10_000,
      currency: 'sek',
      description: '1 month subscription to The Hub News'
    )

    if charge[:paid]
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    else
      redirect_to root_path, notice: 'Sorry, something went wrong..'
    end
	end

	private

	def stripe_token(params)
		Rails.env.test? ? generate_test_token : params[:stripeToken]
	end

	def generate_test_token
		StripeMock.generate_card_token
	end

	def mock_stripe_in_test
		StripeMock.start if Rails.env.test?
	end
end
