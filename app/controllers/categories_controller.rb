class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		@articles = Article.all
	end

	def show
		@category = Category.select(:name)
		if @category == 'sport'
			@articles = Article.find(params[category_id: 1])
		elsif @category == 'tech'
      @article = Article.find(params[category_id: 2])
		elsif @category == 'local'
			@article = Article.find(params[category_id: 3])
		elsif @category == 'global'
      @article = Article.find(params[category_id: 4])
		elsif @category == 'entertainment'
			@article = Article.find(params[category_id: 5])
		elsif @category == 'politics'
			@article = Article.find(params[category_id: 6])
		end
  end
end
