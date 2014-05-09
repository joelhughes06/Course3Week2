class CategoriesController < ApplicationController
  before_action :require_category
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def require_category
		@category = Category.find(params[:id])
	end
	

end