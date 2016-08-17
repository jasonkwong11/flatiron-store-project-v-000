class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def add_item(item_id)
   new_item = Item.find_by(id: item_id)
    if items.include?(new_item)
      current_line_item = line_items.find_by(item_id: new_item.id)
      current_line_item.quantity += 1
      current_line_item
    else
      new_line_item = new_item.line_items.build(quantity: 1)
      new_line_item.cart = self
      new_line_item
    end
  end

  def total
    total_price = 0
    self.items.each do |item|
      total_price += item.price
    end
     total_price
  end

end
