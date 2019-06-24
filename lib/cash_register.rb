require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction
  def initialize(discount = 0)
    self.total = 0
    self.discount = discount
    self.items = []
    self.last_transaction = {}
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      self.items << title
    end
    self.last_transaction = {price: price, quantity: quantity}
    self.total = self.total.to_f + price * quantity
  end

  def apply_discount
  self.total = self.total - (self.total*self.discount/100.to_f)
    if self.discount > 0
    "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction[:price]
    self.last_transaction[:quantity].times do
      self.items.pop 
    end
  end

end
