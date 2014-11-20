class StaticPagesController < ApplicationController
  def home
    name = params[:name]
    puts name
  end

  def pay
  end

  def share
  end
end
