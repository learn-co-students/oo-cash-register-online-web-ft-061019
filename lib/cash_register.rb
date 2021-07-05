class CashRegister 

    attr_accessor :total, :discount, :items, :last_transaction
    def initialize(discount = 0.0)
        self.total = 0 
        self.discount = discount
        self.last_transaction = last_transaction
        @items = []
    end

    def add_item(items, price, quantity =1)
        quantity.times do 
            @items << items
        end 
        self.total += price*quantity
        self.last_transaction = price * quantity
    end

    def apply_discount
        if self.discount > 0
          self.total = self.total-(self.total*(self.discount/100.to_f))
          "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total.to_f - self.last_transaction.to_f
    end

end 

##Paired Programming with Michael Fox 