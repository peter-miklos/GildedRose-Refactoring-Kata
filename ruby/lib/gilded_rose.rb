require 'item'

class GildedRose

  METHOD_HELPER = {"Aged Brie" => "aged_brie",
                   "Backstage passes to a TAFKAL80ETC concert" => "b_pass"}
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  Q_CHANGE = 1
  CHANGED_DAYS = 1

  def initialize(items, method_helper: METHOD_HELPER)
    @items = items
    @method_helper = method_helper
  end

  def update_quality()
    @items.reject{|i| i.name == "Sulfuras, Hand of Ragnaros"}.each do |item|
      update_sell_in(item)
      update_quality_of_an_item(item) if quality_in_range?(item)
    end
  end

  private

  def update_sell_in(item)
    item.sell_in -= CHANGED_DAYS
  end

  def update_quality_of_an_item(item)
    m_name = @method_helper[item.name] == nil ? "update_normal_items_quality" :
             "update_#{@method_helper[item.name]}_quality"
    send(m_name.to_sym, item)
  end

  def update_aged_brie_quality(item)
    item.quality += Q_CHANGE
    item.quality += Q_CHANGE if double_the_quality_change?(item)
  end

  def update_b_pass_quality(item)
    if item.sell_in < 1 then item.quality -= item.quality
    elsif item.sell_in < 6 then item.quality += Q_CHANGE * 3
    elsif item.sell_in < 11 then item.quality += Q_CHANGE * 2
    else item.quality += Q_CHANGE
    end
  end

  def update_normal_items_quality(item)
    item.quality -= Q_CHANGE
    item.quality -= Q_CHANGE if double_the_quality_change?(item)
  end

  def double_the_quality_change?(item)
    item.sell_in < 1 && quality_in_range?(item)
  end

  def quality_in_range?(item)
    item.quality > MIN_QUALITY && item.quality < MAX_QUALITY
  end
end
