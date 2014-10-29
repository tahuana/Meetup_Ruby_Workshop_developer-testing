class GildedRose
  attr_reader :items
  
  def initialize item_attributes
    @items = item_attributes
  end

  def update_attributes_for_new_day
    @items.each do |item|
      item.update_quality
      item.update_sell_in
    end
  end
end
