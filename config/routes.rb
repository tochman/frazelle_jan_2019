Rails.application.routes.draw do
	devise_for :users

	root controller: :articles, action: :index
	resources :articles, only: [:index, :show, :create, :new]
	resources :categories, only: [:show]

	namespace :staff_content do
    resources :articles, only: [:index, :create, :new]
  end
end
