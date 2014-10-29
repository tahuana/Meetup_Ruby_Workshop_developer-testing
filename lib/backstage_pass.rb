class BackstagePass < RegularItem
  def to_s
    "Backstage passes to #{name}, #{sell_in}, #{quality}"
  end

  def new_quality
    return MIN_ITEM_QUALITY if self.is_stale
    conditions = [self.sell_in < 11, self.sell_in < 6]
    self.quality + 1 + conditions.count(true)
  end

  def update_quality
    self.quality = [self.new_quality, MAX_ITEM_QUALITY].min
  end
end
