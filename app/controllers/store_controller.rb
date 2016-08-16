class StoreController < ApplicationController
  
  def index
    @categories = Category.all
    @items = Item.all
  end

  def logged_in?
    true if session[:id] 
  end
end
