class StaticPagesController < ApplicationController
  def home
    name = params[:name]
    puts name
  end

  def thankyou


  end
end
