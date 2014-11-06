class AgedItem < RegularItem

  def to_s
    "Aged #{name}, #{sell_in}, #{quality}"
  end

private

  def tomorrows_quality
    self.quality + (is_stale ? 2 : 1)
  end

end
