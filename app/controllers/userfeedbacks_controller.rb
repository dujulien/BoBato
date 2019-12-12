class UserfeedbacksController < ApplicationController

  before_action :current_user, only: [:create]

  def create
   @profile= Profile.find(params[:profile_id])
   @userfeedback = Userfeedback.create(userfeedback_params)
   @userfeedback.user_id = current_user.id
    @userfeedback.profile_id = @profile.id
   if @userfeedback.save
     redirect_to @profile
   else
     flash.now[:danger] = "erreur"
   end
 end
 def show
   @userfeedback = Userfeedback.find(params[:profile_id])
 end

 private
 def userfeedback_params
   params.permit(:rating, :comment)
 end
end
