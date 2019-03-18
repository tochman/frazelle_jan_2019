Rails.application.routes.draw do
  get 'categories/show'
	devise_for :users

	root controller: :articles, action: :index
	resources :articles, only: [:index, :show]
	resources :categories, only: [:index, :show]
end
