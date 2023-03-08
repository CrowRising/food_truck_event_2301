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
    #this method  will retund an array of items that have a quantity
      #greater than 50 and are sold by more than one truck
        #iterate over total inventory find inventoty by truck 
          # inventory by quantity and use a && operator
  end

  def total_inventory
end