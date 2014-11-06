class BackstagePass < RegularItem

  def to_s
    "Backstage passes to #{name}, #{sell_in}, #{quality}"
  end

private

  def tomorrows_quality
    return MIN_ITEM_QUALITY if is_stale
    conditions_for_bonus_quality_increments = [self.sell_in < 11, self.sell_in < 6]
    self.quality + 1 + conditions_for_bonus_quality_increments.count(true)
  end

end
