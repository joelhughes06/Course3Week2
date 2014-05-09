class UsersController < ApplicationController

	def index

	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to sign_in_path
		else render :new
		end
	end

	def show

	end

	def sign_in
		redirect_to "/users/sign_in"
	end

	def user_params
  		params.require(:sign_in).permit(:username, :password, :full_name)
  end

end