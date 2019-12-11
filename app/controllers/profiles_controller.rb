class ProfilesController < ApplicationController
 
  def show
  	@profile = Profile.find(params[:id])
    @deliveries = @profile.user.deliveries
  end

  def edit
  	@profile = Profile.find(params[:id])
  end

  def update
  	@profile = Profile.find(params[:id])
    if @profile.update(first_name: params[:first_name],last_name: params[:last_name],birthdate: params[:birthdate], description: params[:description],city: params[:city])
      flash[:success] = 'Modifications enregistrées' 
        redirect_to @profile
    else
      flash[:error] = ["Les modifications n'ont pas pu être enregistrées"]
        render :edit
    end

  end	
end
