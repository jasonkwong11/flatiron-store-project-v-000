class StoreController < ApplicationController
  
  def index
    @categories = Category.all
    @user = current_user
    @items = Item.all
  end

  def logged_in?
    true if session[:id] 
  end
end
