require 'item'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.reject{|i| i.name == "Sulfuras, Hand of Ragnaros"}.each do |item|
      update_sell_in(item)
      update_quality_of_an_item(item) if item.quality > 0 && item.quality < 50
    end
  end
end

private

def update_sell_in(item)
  item.sell_in -= 1
end

def update_quality_of_an_item(item)
  case item.name
  when "Aged Brie" then update_aged_brie_quality(item)
  when "Backstage passes to a TAFKAL80ETC concert" then update_b_pass_quality(item)
  else update_non_reserved_items_quality(item)
  end
end

def update_aged_brie_quality(item)
  item.quality += 1
  item.quality += 1 if item.sell_in < 1 && item.quality < 50
end

def update_b_pass_quality(item)
  if item.sell_in < 1 then item.quality -= item.quality
  elsif item.sell_in < 6 then item.quality += 3
  elsif item.sell_in < 11 then item.quality += 2
  else item.quality += 1
  end
end

def update_non_reserved_items_quality(item
  item.quality -= 1
  item.quality -= 1 if item.sell_in < 1 && item.quality > 0
end
