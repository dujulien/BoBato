class PicturesController < ApplicationController
	def create
    	@convoy = Convoy.find(params[:convoy_id])
    	@convoy.pictures.attach(params.permit(:pictures))
    end
end
