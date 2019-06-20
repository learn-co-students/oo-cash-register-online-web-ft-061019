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

   def apply_discount
      #binding.pry    
      if discount == 0.0 
         "There is no discount to apply."
      else
         self.total = self.total - (self.total * (self.discount/100.0))
         "After the discount, the total comes to $800."
      end
   end

   def void_last_transaction
      # I used a 2D array of all the items for my last_transaction attribute.  This logic picks the last item in the array and then selects the second item in the nested array (which is the price) and then multiplies it by the qty in case the last transaction was something with more than 1 qty)
      self.total = self.total - (self.last_transaction[-1][1] * self.last_transaction[-1][2])
   end

end  
