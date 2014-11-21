class StaticPagesController < ApplicationController
  def home
    name = params[:name]
    puts name
  end
end
