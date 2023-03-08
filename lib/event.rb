class Event 
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def  add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |food_truck| food_truck.inventory.include?(item) }
  end

  def overstocked_items
    total_inventory.select do |item|
      food_trucks_that_sell(item).length >= 2 && food_trucks_that_sell(item).sum { |food_truck| food_truck.check_stock(item) } > 50
    end
    #this method  will retund an array of items that have a quantity
      #greater than 50 and are sold by more than one truck
        #iterate over total inventory find inventoty by truck 
          # inventory by quantity and use a && operator
  end

  def total_inventory
    inventory_total = {}
    @food_trucks.map do |food_truck|
      food_truck.inventory.keys.flatten.uniq.map do |item|
        inventory_total[item] = { food_trucks: food_trucks_that_sell(item),
                                  quantity: food_trucks_that_sell(item).sum { |food_truck| food_truck.check_stock(item)}}
      end
    end
    inventory_total
  end
end