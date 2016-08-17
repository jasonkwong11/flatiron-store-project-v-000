class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'


  def logged_in?
    true if session[:id] 
  end

  def current_cart
    if current_cart_id.nil?
      nil
    else
      Cart.find(current_cart_id)
    end
  end

  def current_cart=(cart)
    if cart.nil?
      self.current_cart_id = nil
    else
      self.current_cart_id = cart.id
    end
    self.save
  end

end


