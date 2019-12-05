class PicturesController < ApplicationController
	def create
    	@convoy = Convoy.find(params[:convoy_id])
    	@convoy.picture.attach(params[:picture])
			redirect_to(convoy_path(@convoy))
    end
end
