require_relative 'item'

class BackstagePass < Item
  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    @quality = 0 and return if @sell_in < 0
    return unless (@quality < 50)
    @quality = @quality + 1
    @quality += 1 if @sell_in < 10 && @quality < 50
    @quality += 1 if @sell_in < 5 && @quality < 50
  end

end
