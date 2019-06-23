class CashRegister
    attr_accessor :total, :discount, :cart, :last_transaction
    def initialize(discount=0)
        @total = 0.to_f
        @discount = discount
        @cart = nil
        @last_transaction = nil
    end

    def add_item(item_name, item_price, quantity=1)
        # Update cart
        self.cart ||= []
        quantity.times { self.cart << item_name}
        # Update total
        self.total += (item_price * quantity)
        # Save this transaction in a hash
        self.last_transaction = {"item" => item_name, "price" => item_price, "quantiy" => quantity}
    end

    def apply_discount
        if self.discount > 0
            self.total -= (self.total * (self.discount.to_f / 100))
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        self.cart
    end

    def void_last_transaction
        # Remove the last item
        self.last_transaction["quantiy"].times { self.cart.pop }
        # Deduct item from the total
        self.total -= (self.last_transaction["price"] * self.last_transaction["quantiy"])
        
    end

end
