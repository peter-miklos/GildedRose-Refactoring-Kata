require 'item'

class GildedRose

  METHOD_HELPER = {"Aged Brie" => "aged_brie",
                   "Backstage passes to a TAFKAL80ETC concert" => "b_pass"}

  def initialize(items, method_helper = METHOD_HELPER)
    @items = items
    @method_helper = method_helper
  end

  def update_quality()
    @items.reject{|i| i.name == "Sulfuras, Hand of Ragnaros"}.each do |item|
      update_sell_in(item)
      update_quality_of_an_item(item) if item.quality > 0 && item.quality < 50
    end
  end

  private

  def update_sell_in(item)
    item.sell_in -= 1
  end

  def update_quality_of_an_item(item)
    m_name = @method_helper[item.name] == nil ? "update_normal_items_quality" : "update_#{@method_helper[item.name]}_quality"
    send(m_name.to_sym, item)
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

  def update_normal_items_quality(item)
    item.quality -= 1
    item.quality -= 1 if item.sell_in < 1 && item.quality > 0
  end
end
