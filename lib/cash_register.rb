require "pry"


class CashRegister
   attr_accessor :total, :discount, :items, :last_item_price

   def initialize(emp_discount = 0)
       @total = 0.0
       @discount = emp_discount
       @items = []
   end

   def add_item (title, price, quantity = 1)
      @total = @total + (price * quantity)
      quantity.times do 
         @items << title
      end
      @last_item_price = price
   end

   def apply_discount
      if @discount > 0 
         emp_discount = @discount.to_f / 100.0
         discount = @total.to_f * emp_discount
         new_total = @total - discount
         @total = new_total
         return_message = "After the discount, the total comes to $#{@total.to_i}."
      else
         return_message = "There is no discount to apply."
      end
   end

   def void_last_transaction
      @total = @total - @last_item_price
   end

end