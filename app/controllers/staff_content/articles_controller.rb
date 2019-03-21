class StaffContent::ArticlesController < ApplicationController
	before_action :check_staff_auth

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def show
	end

	def create
		@article = Article.new(article_params)
		binding.pry
		if @article.save
				redirect_to staff_content_articles_path, notice: 'Article was successfully created.'
		else
				redirect_to staff_content_articles_path, alert: 'You have to fill out all the fields'
		end
	end

	private

	def check_staff_auth
		if user_signed_in? && current_user.role != "journalist"
			redirect_to root_path
		end
	end

	def article_params
		binding.pry
		params.permit(:title, :content)
	end
end
