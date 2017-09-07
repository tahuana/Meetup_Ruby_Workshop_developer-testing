class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality

    @items.each do |item|
      item.update_sell_in
      # WTF? why are we updating sell in here? #update_quality
      # if (item.name != "Sulfuras, Hand of Ragnaros")
      #   item.sell_in = item.sell_in - 1;
      # end

      if (item.name != "Aged Brie" && item.name != "Backstage passes to a TAFKAL80ETC concert")
        if (item.quality > 0)
          if (item.name != "Sulfuras, Hand of Ragnaros")
            item.quality = item.quality - 1
          end
        end
      else
        # deal with items that don't degrade (and may improve) over time
        if (item.quality < 50)
          item.quality = item.quality + 1
          if (item.name == "Backstage passes to a TAFKAL80ETC concert")
            if (item.sell_in < 10)
              if (item.quality < 50)
                item.quality = item.quality + 1
              end
            end
            if (item.sell_in < 5)
              if (item.quality < 50)
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      # # WTF? why are we updating sell in here? #update_quality
      # if (item.name != "Sulfuras, Hand of Ragnaros")
      #   item.sell_in = item.sell_in - 1;
      # end
      # items degrade faster or altogether after sell_in reaches 0
      if (item.sell_in < 0)
        if (item.name != "Aged Brie")
          if (item.name != "Backstage passes to a TAFKAL80ETC concert")
            if (item.quality > 0)
              if (item.name != "Sulfuras, Hand of Ragnaros")
                item.quality = item.quality - 1
              end
            end
          else
            # instead fo subtracting item.quality, set it to 0.
            item.quality = 0
          end
        else
          if (item.quality < 50)
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

end