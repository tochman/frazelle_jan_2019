class ArticlesController < ApplicationController
	def index
		@categories = Category.all

		city = request.location.city

		if (city == "Gothenburg")
			@articles = Article.where(city: ["Gothenburg", nil])
		elsif (city == "Stockholm")
			@articles = Article.where(city: ["Stockholm", nil])
		else
			@articles = Article.where(city: [nil])
		end
	end

	def show
		@article = Article.find(params[:id])
	end
end