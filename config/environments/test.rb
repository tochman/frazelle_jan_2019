Rails.application.configure do
  config.cache_classes = true
  config.eager_load = false

  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_dispatch.show_exceptions = false

  config.action_controller.allow_forgery_protection = false

  config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
	config.action_mailer.delivery_method = :test

	config.action_mailer.default_url_options = { host: 'localhost:3000' }

	config.active_support.deprecation = :stderr

	config.stripe.secret_key = Rails.application.credentials.stripe_secret_key
	config.stripe.publishable_key = Rails.application.credentials.stripe_publishable_key

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
