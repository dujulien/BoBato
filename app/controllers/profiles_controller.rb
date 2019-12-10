class ProfilesController < ApplicationController
 
  def show
  	@profile = Profile.find(params[:id])

  end

  def edit
  	@profile = Profile.find(params[:id])
  end

  def update
  	@profile = Profile.find(params[:id])
    if @profile.update(first_name: params[:first_name],last_name: params[:last_name],birthdate: params[:birthdate], description: params[:description],city: params[:city])
      flash[:success] = 'The item was updated' 
        redirect_to @profile
    else
      flash[:error] = 'Erreur'
        render :edit
    end

  end	
end
