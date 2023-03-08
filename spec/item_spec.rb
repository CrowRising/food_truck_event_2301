require './lib/item'
require './lib/food_truck'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({ name: 'Peach Pie (Slice)', price: "$3.75" })
    @item2 = Item.new({ name: 'Apple Pie (Slice)', price: '$2.50' })
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item2).to be_an(Item)
      expect(@item1).to be_an(Item)
    end
  end

  describe '#attributes' do 
    it 'has attributes' do
      expect(@item2.name).to eq('Apple Pie (Slice)')
      expect(@item1.name).to eq('Peach Pie (Slice)')
    end

    it 'has price' do
      expect(@item2.price).to eq(2.50)
    end
  end
end
