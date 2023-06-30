
class CashRegister
    attr_accessor :discount, :total

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @item = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity=1)
        transaction_amount = price * quantity
        self.total += transaction_amount 
        quantity.times { @item << title }
        @last_transaction = transaction_amount

    end

    def apply_discount
        if (self.discount > 0)
            discount_amount = (self.total * self.discount)/100
            self.total -= discount_amount
            "After the discount, the total comes to $#{self.total}."
        else
            self.total = "There is no discount to apply."
        end
        
    end

    def items
        @item 
    end

    def void_last_transaction
        self.total -= @last_transaction
    end
end