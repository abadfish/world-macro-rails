class ChargesController < ApplicationController

  def new
  end

  def create
  # Amount in cents
    @amount = 500
    binding.pry
    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :currency    => 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path

  end
end
