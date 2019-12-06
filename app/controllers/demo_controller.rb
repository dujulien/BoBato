class DemoController < ApplicationController
	def index
    @convoys = Convoy.all
	end
end
