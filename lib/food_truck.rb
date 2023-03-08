class FoodTruck
  attr_reader :name,
              :inventory, 
              :check_stock, 
              :potential_revenue

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
    @potential_revenue = 0.0
  end

  def check_stock(item)
    check_stock = 0
    @inventory.each do |key, value|
      check_stock += value
    end
    check_stock
  end

  def stock(item, quantity)
    @inventory[item] += quantity
    @potential_revenue += (item.price * quantity)
  end

end
