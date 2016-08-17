class CartsController < ApplicationController
before_action :set_cart, only: [:show, :checkout, :edit, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def show
    @cart = current_user.current_cart
  end

  def current_cart
    Cart.find(params[:id])
  end

  def checkout
    remove_items
    current_user.current_cart = nil
    current_user.current_cart.save
    redirect_to cart_path(@cart)
  end

  private
    def set_cart
      @cart = Cart.find_by(id: params[:id])
    end

    def remove_items
    
      current_user.current_cart.line_items.each do |line_item|
        item = Item.find(line_item.item_id)
        item.inventory -= line_item.quantity
        item.save
     end
    end
end
