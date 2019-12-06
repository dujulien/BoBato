class AvatarsController < ApplicationController
  def create
  	@user = User.find(params[:user_id])
    @user.avatar.attach(params.permit(:avatar))
    redirect_to(user_path(@user))
  end
end
