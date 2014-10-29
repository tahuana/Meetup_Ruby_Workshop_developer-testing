require 'rspec'
require 'approvals/rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/item'
require_relative '../lib/regular_item'
require_relative '../lib/aged_item'
require_relative '../lib/backstage_pass'
require_relative '../lib/legendary_item'
require_relative '../lib/conjured_item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(item_attributes)

    verify { characterize(subject, 20) }
  end
  
end

private

def item_attributes
  [
    RegularItem.new('Mail Armour', 10, 20),
    RegularItem.new('Mail Armour', 10, 1),
    RegularItem.new('+5 Dexterity Vest', 10, 20),
    RegularItem.new('Elixir of the Mongoose', 5, 7),
    AgedItem.new('Brie', 4, 9),
    AgedItem.new('Brie', 1, 49),
    BackstagePass.new('a TAFKAL80ETC concert', 15, 17),
    BackstagePass.new('a TAFKAL80ETC concert', 5, 49),
    LegendaryItem.new('Sulfuras, Hand of Ragnaros', -1, 80),
    ConjuredItem.new('Mana Cake', 10, 19),
    AgedItem.new('Stilton', 4, 19),
    AgedItem.new('Stilton', 11, 39),
    AgedItem.new('Elvish Wine', 4, 9),
    AgedItem.new('Elvish Wine', 1, 49),
    BackstagePass.new('the Rat Queens', 15, 17),
    BackstagePass.new('the Rat Queens', 5, 49),
    BackstagePass.new('the Hard Rock Troll Orchestra', 15, 17),
    BackstagePass.new('the Hard Rock Troll Orchestra', 5, 49),
    ConjuredItem.new('loincloth', 10, 20),
    ConjuredItem.new('fake beard', 20, 30)
  ]
end

def characterize(subject, days)
  characterization = []

  (1..days).each_with_index do |day|
    subject.update_attributes_for_new_day

    characterization << "Day #{day} of #{days}"
    subject.items.each { |item| characterization << "  #{item.to_s}" }
  end

  characterization.join("\n")
end
