class CashRegister

    attr_accessor :total, :discount, :items

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        @total += (price * quantity)
        @items << {title: title, price: price, quantity: quantity}
    end
    
    def apply_discount
        if discount != 0 
        @total *= (1 - discount/100.00) 
        return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        result = []
        @items.each do |line_item| 
        line_item[:quantity].times do
        result << line_item[:title]
            end
        end
        result
    end

    def void_last_transaction
        last_transaction = @items.pop()
        @total -= (last_transaction[:price] * last_transaction[:quantity])
        return @total
    end

end
