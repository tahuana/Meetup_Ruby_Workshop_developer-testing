class GildedRose
  attr_reader :items
  
  def initialize item_attributes
    @items = item_attributes.map { |args| Item.new(*args) }
  end

  def update_quality

    for i in 0..(@items.size-1)
      case @items[i].name
      when "Sulfuras, Hand of Ragnaros"
      when "Aged Brie"
        aged_brie @items[i]
      when "Backstage passes to a TAFKAL80ETC concert"
        backstage_pass @items[i]
      when "Conjured Mana Cake"
        conjured @items[i]
      else
        standard_item @items[i]
      end
    end
  end
end

def backstage_pass item
  if item.quality <50
    item.quality += 1
    if (item.sell_in < 6)
      item.quality += 2
    elsif (item.sell_in < 11)
      item.quality += 1
    end
  end
  item.quality = 50 if item.quality > 50
  item.quality = 0 if item.sell_in < 1
  item.sell_in -= 1
end

def aged_brie item
  item.quality += 1 if item.quality < 50
  if item.sell_in < 1
    if (item.quality < 50)
      item.quality += 1
    end
  end
  item.sell_in -= 1
end

def standard_item item
  item.quality -= 1
  item.quality -= 1 if item.sell_in < 1
  item.quality = 0 if item.quality < 0
  item.sell_in -= 1
end

def conjured item
  item.quality = item.quality - 2
  item.quality = item.quality - 2 if item.sell_in < 1
  item.quality = 0 if item.quality < 0
  item.sell_in = item.sell_in - 1
end