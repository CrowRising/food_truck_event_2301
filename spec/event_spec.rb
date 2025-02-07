require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  before(:each) do
    @event = Event.new('South Pearl Street Farmers Market') 
    @food_truck1 = FoodTruck.new('Rocky Mountain Pies')
    @food_truck2 = FoodTruck.new('Ba-Nom-a-Nom')  
    @food_truck3 = FoodTruck.new('Palisade Peach Shack')
    @item1 = Item.new({ name: 'Peach Pie (Slice)', price: '$3.75' })
    @item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
    @item3 = Item.new({ name: 'Peach-Raspberry Nice Cream', price: '$5.30' })
    @item4 = Item.new({ name: 'Banana Nice Cream', price: '$4.25' })
  end

  describe '#intialize' do
    it 'exists' do
      expect(@event).to be_an(Event)
    end
  end

  describe '#attributes' do
    it 'has name' do
      expect(@event.name).to eq('South Pearl Street Farmers Market')
    end

    it 'has food trucks' do
      expect(@event.food_trucks).to eq([])
    end
  end

  describe '#adds trucks with stock to event' do
    it 'stocks items to trucks and adds trucks to event' do
      @food_truck1.stock(@item1, 35) 
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65) 

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_trucks).to eq([@food_truck1, @food_truck2, @food_truck3])
    end

    it 'has food truck names' do
      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_truck_names).to eq(['Rocky Mountain Pies', 'Ba-Nom-a-Nom', 'Palisade Peach Shack'])
    end
  end

  describe '#food_trucks_that_sell' do
    it 'can check for items sold' do
      @food_truck1.stock(@item1, 35) 
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65) 

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.food_trucks_that_sell(@item1)).to eq([@food_truck1, @food_truck3])
      expect(@event.food_trucks_that_sell(@item4)).to eq([@food_truck2])
    end
  end
  
  describe '#overstocked_items' do
    it 'has list of overstocked items' do
      @food_truck1.stock(@item1, 35) 
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65) 

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.overstocked_items).to eq([@item1])
    end
  end

  describe '#sorted_items_list' do
    it 'has list of items sorted alphabetically' do
      @food_truck1.stock(@item1, 35) 
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65) 

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.sorted_items_list).to eq(['Apple Pie (Slice)', 'Banana Nice Cream', 'Peach Pie (Slice)', 'Peach-Raspberry Nice Cream' ])
    end
  end

  describe '#total_inventory' do
    it 'has list of total inventory' do
      @food_truck1.stock(@item1, 35) 
      @food_truck1.stock(@item2, 7)
      @food_truck2.stock(@item4, 50)
      @food_truck2.stock(@item3, 25)
      @food_truck3.stock(@item1, 65) 

      @event.add_food_truck(@food_truck1)
      @event.add_food_truck(@food_truck2)
      @event.add_food_truck(@food_truck3)

      expect(@event.total_inventory).to be_a Hash
      # I think I could have written the nested hash out...
        # but I didn't, is this acceptable? (to call Hash)
    end
  end
end