require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_transaction, :items, :last_price
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_price = 0 
    end

    def add_item(title, amount, quantity = 1)
        quantity.times do
        self.items << title
        end 
        self.last_price = amount * quantity
        # binding.pry

        self.total += amount * quantity
    end

    def apply_discount
        if self.discount != 0 
        discount_percent = (discount.to_f/100)
        self.total = total - (discount_percent * total).to_i 
        "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        # binding.pry
        end
    end

    def void_last_transaction
        self.total = total - self.last_price
        # binding.pry
    end
end
