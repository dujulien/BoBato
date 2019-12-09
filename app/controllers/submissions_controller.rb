class SubmissionsController < ApplicationController
	before_action :authenticate_user!, only: [:index, :create]   
	def index
	  @submissions = Submission.all
	end

  def create
  	puts "$"*40
  	puts params.inspect
  	puts "$"*40

 		@submission = Submission.new(submission_params)
 		@submission.skipper = current_user
	  if @submission.save
	    redirect_to request.referrer, notice: 'Candidature envoyée'
	  else
	    flash[:danger] = 'Erreur dans la création de la candidature'
	    redirect_to request.referrer
	  end
	end

	def destroy
		@submission = Submission.find_by(submission_params)
		@submission.destroy
		redirect_to request.referrer
	end

  private

  def submission_params
    params.permit(:convoy_id, :skipper_id)
  end

end
