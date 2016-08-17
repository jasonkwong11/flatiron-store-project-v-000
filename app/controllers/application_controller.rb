class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_cart
    Cart.find(id: cart_id)
  end


  private

  # Overwriting the sign_out redirect path method
   def total_price(price, quantity)
     price * quantity
   end
end
