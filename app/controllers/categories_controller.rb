class CategoriesController < ApplicationController
	def show
		@categories = Category.all
		@articles = Article.where(category_id: params[:id])
	end
end