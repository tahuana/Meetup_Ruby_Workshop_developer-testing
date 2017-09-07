require 'rspec'
require 'approvals/rspec'

require_relative '../lib/gilded_rose'
require_relative '../lib/aged_item'
require_relative '../lib/backstage_pass'
require_relative '../lib/legendary_item'
require_relative '../lib/regular_item'
require_relative '../lib/conjured_item'

describe GildedRose do

  it 'knows how to update quality for items' do
    subject = GildedRose.new(item_attributes)

    verify { characterize(subject, 20) }
  end

end

private

def item_attributes
  item_attributes = [
    RegularItem.new('Mail Armour', 10, 20),
    RegularItem.new('Mail Armour', 10, 1),
    RegularItem.new('+5 Dexterity Vest', 10, 20),
    RegularItem.new('Elixir of the Mongoose', 5, 7),
    AgedItem.new('Aged Brie', 4, 9),
    AgedItem.new('Aged Brie', 1, 49),
    BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 15, 17),
    BackstagePass.new('Backstage passes to a TAFKAL80ETC concert', 5, 49),
    # TODO: remove the -1 special value here.
    LegendaryItem.new('Sulfuras, Hand of Ragnaros', -1, 80)
  ]
end

def characterize(subject, days)
  characterization = []

  (1..days).each do |day|
    subject.update_quality

    characterization << "Day #{day} of #{days}"
    subject.items.each { |item| characterization << "  #{item.to_s}" }
  end

  characterization.join("\n")
end
