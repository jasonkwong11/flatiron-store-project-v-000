class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
   current_line_item = LineItem.find_by(item_id: item_id)
    if current_line_item.nil?
      cart_id = self.id
      LineItem.new(item_id: item_id, cart_id: cart_id)
    else
      current_line_item.quantity += 1
      current_line_item
    end
  end

  def total
    total_price = 0
    self.items.each do |item|
      total_price += item.price
    end
     total_price
  end

  def logged_in?
    true if session[:id] 
  end

end
