require 'rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(items)

    characterization = characterize(subject, 20)

    expect(characterization).to eq(expected)
  end

end

private

def items
  item_attributes = [
    ['Mail Armour', 10, 20],
    ['Aged Brie', 4, 9],
    ['Backstage passes to a TAFKAL80ETC concert', 15, 17]
  ]

  item_attributes.map { |args| Item.new(*args) }
end

def characterize(subject, days)
  characterization = []

  (1..days).each do
    subject.update_quality

    subject.items.each { |item| characterization << item.to_s }
  end

  result = characterization.join("\n")
  File.open('characterization.txt', 'w') { |f| f.write(result) }
  result
end

def expected
  File.read('characterization_master.txt')
end
