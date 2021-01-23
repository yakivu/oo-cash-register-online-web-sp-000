require "pry"
class CashRegister
  attr_accessor :total, :discount, :items, :last_item
  # @@last_item = 0

  def initialize(discount=nil, total=0, items=[])
    @total = total
    @discount = discount
    @items = items
  end

  def add_item(title, price, quantity=1)
    # @@last_item = price * quantity
    self.last_item = price * quantity
    self.total += (price * quantity)
    quantity.times { @items.push(title) }
  end

  def apply_discount
    if @discount
      perc_discount = self.discount / 100.0
      self.total = self.total - (self.total * perc_discount).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  # STILL NEED TO MAKE IT self.total RETURN 0.0
  def void_last_transaction
    void_item = @items.pop(1)
    self.total -= self.last_item
  end

end

new_register = CashRegister.new

new_register.add_item("macbook air", 1000)
p new_register.apply_discount
p new_register.total

# new_register.add_item("eggs", 1.99)
# new_register.add_item("tomato", 1.76, 3)
# new_register.add_item("apple", 0.99)

# new_register.add_item("apple", 0.99)
# new_register.add_item("tomato", 1.76)
# new_register.void_last_transaction
# p new_register.items
# p new_register.total
# ["eggs", "tomato", "tomato", "tomato"]