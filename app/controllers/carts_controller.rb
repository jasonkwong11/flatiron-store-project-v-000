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
    @cart = Cart.find(params[:id])
  end

  def current_cart
    Cart.find(params[:id])
  end

  def checkout
    @cart = set_cart
    @cart.checkout
    current_user.current_cart = nil
    redirect_to cart_path(@cart), notice: "Thanks for your order!"
  end

  private
    def set_cart
      @cart = Cart.find_by(id: params[:id])
    end
end
