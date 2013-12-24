class UsersController < ApplicationController
	before_filter :authenticate_user!, except: [:landing_page]

	def landing_page
		@current_user = current_user
	end

	def show
		@user = User.find(params[:id])
		authorize! :show, @user
	end

end
