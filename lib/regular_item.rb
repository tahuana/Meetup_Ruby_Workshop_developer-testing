class RegularItem < Item

  MAX_ITEM_QUALITY = 50
  MIN_ITEM_QUALITY = 0

  def update_sell_in
    self.sell_in -= 1
  end

  def update_quality
    self.quality = self.class.constrain_quality(tomorrows_quality)
  end

private

  def tomorrows_quality
    self.quality - (is_stale ? 2 : 1)
  end

  def is_stale
    self.sell_in <= 0
  end

  def self.constrain_quality(quality)
    quality = MIN_ITEM_QUALITY if quality < MIN_ITEM_QUALITY
    quality = MAX_ITEM_QUALITY if quality > MAX_ITEM_QUALITY
    quality
  end

end
