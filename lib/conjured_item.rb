class ConjuredItem < RegularItem
  def to_s
    "Conjured #{name}, #{sell_in}, #{quality}"
  end

  def new_quality
    self.quality - (self.is_stale ? 4 : 2)
  end
end
