require_relative 'item'

class RegularItem < Item
  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    @quality -= 1 if @quality > 0
    @quality -= 1 if @sell_in < 0 && @quality > 0
  end

end