require 'rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do
  it 'should update a conjured item when sellby > 1 and quality > 0' do
    item = Item.new('Conjured Mana Cake', 10, 20)
    conjured item
    expect(item.to_s).to eq('Conjured Mana Cake, 9, 18')
  end

  it 'should update a conjured item when sell_by = 0 and quality > 0' do
    item = Item.new('Conjured Mana Cake', 0, 20)
    conjured item
    expect(item.to_s).to eq('Conjured Mana Cake, -1, 16')
  end

  it 'should update a conjured item when sell_by = 0 and quality = 0' do
    item = Item.new('Conjured Mana Cake', 0, 0)
    conjured item
    expect(item.to_s).to eq('Conjured Mana Cake, -1, 0')
  end
end