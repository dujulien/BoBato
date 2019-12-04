class ConvoysController < ApplicationController


	def index
	  	@convoys = Convoy.all
	end

	def show
	 	@convoys = Convoy.find(params[:id])
	end

end
