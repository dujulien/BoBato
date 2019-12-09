class ChargesController < ApplicationController

	def new
	end

	def create
	  @convoy = Convoy.find(params[:convoy_id])
	  @skipper = User.find(params[:skipper_id])
	  # Amount in cents
	  @amount = (@convoy.convoy_price * 100).to_i

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: 'Rails Stripe customer',
	    currency: 'eur',
	  })

	  # Create new delivery for the considered convoy, with the selected skipper
		Delivery.new.create_after_checkout(@convoy, @skipper, params[:stripeToken])

	  # For the considered convoy, pass all submissions status to false (rejected), except the one with the selected skipper
	  @convoy.update_submissions_status_after_checkout(@skipper)

		redirect_to request.referrer
	end

end
