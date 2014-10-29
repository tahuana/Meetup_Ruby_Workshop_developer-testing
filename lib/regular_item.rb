class RegularItem < Item
  MAX_ITEM_QUALITY = 50
  MIN_ITEM_QUALITY = 0

  def is_stale?
    self.sell_in <= 0
  end

  def update_sell_in
    self.sell_in -= 1
  end

  def new_quality
    self.quality - (self.is_stale? ? 2 : 1)
  end

  # Most items degrade, so this makes sense as a default implementation
  def update_quality
    self.quality = [self.new_quality, MIN_ITEM_QUALITY].max
  end
end
