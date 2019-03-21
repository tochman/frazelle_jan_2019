class StaffContent::ArticlesController < ApplicationController
	before_action :check_staff_auth
	def index
		@article = Article.all
	end

	def new
		@article = Article.new
	end

	def show
	end

	def create
		article = Article.new(params[:id])
		if article.save
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
		params.require(:article).permit(:title, :content)
	end
end
