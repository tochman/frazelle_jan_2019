Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: :registrations,
		confirmations: :confirmations
	}
	root controller: :articles, action: :index
	resources :articles, only: %i[index show]
end