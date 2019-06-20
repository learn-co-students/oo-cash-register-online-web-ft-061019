class CashRegister 

    attr_accessor :total, :discount, :items

    def initialize(discount = 0.0)
        self.total = 0.0
        self.discount = discount 
        self.items = [ ] 
        self.last_transaction = { }
    end 

    def add_item(item, price, quantity = 1)
        if quantity > 1 
            counter = 0 
            while counter < quantity 
                items << item 
                counter += 1
            end 
        else 
            items << item 
        end 
        self.last_transaction << [title, price, qty]
    end 
    

    def apply_discount 
        if self.discount === 0 
            return "There is no discount to apply."
        else
            self.total = self.total - (self.total * self.discount/100.to_f)
            "After the discount, the total comes to $#{self.total.to_i}." 
        end 
    end 

  

end 



