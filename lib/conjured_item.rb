class ConjuredItem < RegularItem
  def new_quality
      self.quality - (self.is_stale? ? 4 : 2)
  end
end
