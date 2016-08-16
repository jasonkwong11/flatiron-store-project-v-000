class User < ActiveRecord::Base
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart'



end