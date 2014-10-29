class AgedItem < RegularItem
  def to_s
    "Aged #{name}, #{sell_in}, #{quality}"
  end

  def new_quality
    self.quality + (self.is_stale ? 2 : 1)
  end

  def update_quality
    self.quality = [self.new_quality, MAX_ITEM_QUALITY].min
  end
end
