class ChargesController < ApplicationController

   def create
     # Amount in cents
     @amount = 11000

     # Set your secret key: remember to change this to your live secret key in production
     # See your keys here https://dashboard.stripe.com/account
     Stripe.api_key = Rails.configuration.stripe[:secret_key]

     # Get the credit card details submitted by the form
     token = params[:stripeToken]

     customer = Stripe::Customer.create(
       :email => params[:stripeEmail],
       :card  => token
     )

     charge = Stripe::Charge.create(
       :customer    => customer.id,
       :amount      => params[:amount],
       :description => 'La Favorite Chateau Flash',
       :currency    => 'eur'
     )
     puts "Success"
     redirect_to new_charge_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
   end
end