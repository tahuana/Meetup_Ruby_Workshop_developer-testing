class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def age_one_day
    @items.each do |item|
      item.update_sell_in
      item.update_quality
    end
  end

end