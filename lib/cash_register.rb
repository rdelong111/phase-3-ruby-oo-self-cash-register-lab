class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @lastprice = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do |item|
      self.items.push(title)
    end
    @lastprice.push([price, quantity])

    self.total += price * quantity
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total *= 1 - self.discount.to_f / 100
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    theitem = @lastprice.pop
    theitem[1].times do |item|
      self.items.pop
      self.total -= theitem[0]
    end
  end
end