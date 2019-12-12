class HomeController < ApplicationController
	def index
    @convoys = Convoy.all.last(8)
	end
end
