class ChargesController < ApplicationController

  require 'mandrill'
  mandrill = Mandrill::API.new 'MANDRILL_API_KEY'

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
       :description => 'La Favorite Réserve du Château Flash',
       :currency    => 'eur'
     )


     redirect_to thankyou_path

    rescue Stripe::CardError => e
      flash[:error] = e.message

   end

   def new

   end
end