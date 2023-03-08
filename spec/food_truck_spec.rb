require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  before(:each) do
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  describe '#intitalize' do
    it 'exists' do
      expect(@food_truck).to be_a(FoodTruck)
    end
  end

  describe '#has attributes' do
    it 'has name' do
      expect(@food_truck.name).to eq("Rocky Mountain Pies")
    end

    it 'has inventory' do
      expect(@food_truck.inventory).to eq({})
    end
  end
end