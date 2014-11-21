class ChargesController < ApplicationController

   def create
     # Amount in cents
     @amount = 11000

     customer = Stripe::Customer.create(
       :email => params[:stripeEmail],
       :card  => params[:stripeToken]
     )

     charge = Stripe::Charge.create(
       :customer    => customer.id,
       :amount      => @amount,
       :description => 'La Favorite Chateau Flash',
       :currency    => 'eur'
     )

   rescue Stripe::CardError => e
     flash[:error] = e.message
     redirect_to charges_path
   end
end


