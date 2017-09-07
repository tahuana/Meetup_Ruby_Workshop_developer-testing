require_relative 'item'

class RegularItem < Item
  def update_sell_in
    @sell_in -= 1
  end
end