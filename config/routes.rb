Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: :registrations,
		confirmations: :confirmations
	}
	root controller: :articles, action: :index
	resources :articles, only: [:index, :show]
	resources :categories, only: [:show]

	namespace :staff_content do
    resources :articles, only: [:index]
  end
end
