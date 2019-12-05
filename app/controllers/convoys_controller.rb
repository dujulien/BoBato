class ConvoysController < ApplicationController


	def index
	  	@convoys = Convoy.page
	end

	def show
	 	@convoys = Convoy.find(params[:id])
	end

end
