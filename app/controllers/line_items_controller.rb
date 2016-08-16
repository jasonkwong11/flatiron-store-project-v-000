class LineItemsController < ApplicationController

  def new
    @lineitem = LineItem.new
  end


end
