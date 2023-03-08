class Event 
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map { |food_truck| food_truck.name }
  end

  def food_trucks_that_sell(item)
    @food_trucks.select { |food_truck| food_truck.inventory.include?(item) }
  end

  def overstocked_items
    total_inventory.keys.select do |key|
      food_trucks_that_sell(key).length >= 2 &&
      food_trucks_that_sell(key).sum {|truck| truck.check_stock(key)} > 50
    end
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

  def sorted_items_list
    list = @food_trucks.flat_map do |food_truck|
      food_truck.inventory.map do |key, _|
        key.name
      end
    end
    list.uniq.sort
  end
end