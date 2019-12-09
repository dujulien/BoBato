class MyConvoysController < ApplicationController
	before_action :user_restriction

	def index
		@my_convoys = User.find(params[:user_id]).convoys
		@user = User.find(params[:user_id])
	end

	def show
		@my_convoy = Convoy.find(params[:id])
		@id = params[:id]
	end

	private

	def user_restriction
		@user = User.find(params[:user_id])
		if @user != current_user
			redirect_to root_path, notice: "Sorry, but you are not allowed to see this page."
		end
	end

end
