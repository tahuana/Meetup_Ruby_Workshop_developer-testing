class GildedRose
  attr_reader :items
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  
  def initialize item_attributes
    @items = item_attributes.map { |args| Item.new(*args) }
  end

  def update_attributes_for_new_day
    @items.each do |item|
      update_quality item
      update_sell_in item
    end
  end

  def update_quality item
    is_stale = (item.sell_in <= 0)
    case item.name
    when "Aged Brie" # Aged
      quality_increment = is_stale ? 2 : 1
      item.quality = [item.quality + quality_increment, MAX_QUALITY].min
    when "Backstage passes to a TAFKAL80ETC concert" # Backstage passes
      conditions = [item.sell_in < 11, item.sell_in < 6]
      quality_increment = 1 + conditions.count(true)
      item.quality = [item.quality + quality_increment, MAX_QUALITY].min
      item.quality = MIN_QUALITY if is_stale
    when "Sulfuras, Hand of Ragnaros" # Legendary
      # do nothing
    when "Conjured Mana Cake" # Conjured
      quality_decrement = is_stale ? 4 : 2
      item.quality = [item.quality - quality_decrement, MIN_QUALITY].max
    else # Regular items
      quality_decrement = is_stale ? 2 : 1
      item.quality = [item.quality - quality_decrement, MIN_QUALITY].max
    end
  end

  def update_sell_in item
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end
end
