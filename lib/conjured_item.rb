class ConjuredItem < RegularItem

  def to_s
    "Conjured #{name}, #{sell_in}, #{quality}"
  end

private

  def tomorrows_quality
    self.quality - (is_stale ? 4 : 2)
  end

end
