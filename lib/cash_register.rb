require 'pry'

class CashRegister
   attr_accessor :total, :discount, :items, :last_transaction

   def initialize(discount=0.0)
      self.total = 0.0
      self.discount = discount
      self.items = []
      self.last_transaction = []
   end

   def add_item(title, price, qty=1)
      qty.times do
         self.total += price.to_f
         self.items << title
      end
      self.last_transaction << [title, price, qty]
   end

end  
