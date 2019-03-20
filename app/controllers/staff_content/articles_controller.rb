class StaffContent::ArticlesController < ApplicationController
	before_action :check_staff_auth
	def index
	end

	def create
		article = Article.new(article_params)

		if article.save
				redirect_to new_article_path, notice: 'Article was successfully created.'
		else
				redirect_to new_article_path, alert: 'You have to fill out all the fields'
		end
	end

	private

	def check_staff_auth
		if user_signed_in? && current_user.role != "journalist"
			redirect_to root_path
		end
	end
end
