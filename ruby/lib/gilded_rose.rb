require 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      update_sell_in(item)

      if item.quality > 0 && item.quality < 50
        case item.name
        when "Aged Brie"
          item.quality += 1
          item.quality += 1 if item.sell_in < 1 && item.quality < 50
        when "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in < 1 then item.quality -= item.quality
          elsif item.sell_in < 6 then item.quality += 3
          elsif item.sell_in < 11 then item.quality += 2
          else item.quality += 1
          end
        when "Sulfuras, Hand of Ragnaros" #do nothing
        else
          item.quality -= 1
          item.quality -= 1 if item.sell_in < 1 && item.quality > 0
        end
      end
    end
  end
end

private

def update_sell_in(item)
  item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
end
