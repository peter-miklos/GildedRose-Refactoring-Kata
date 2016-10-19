class Item

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def name
    @name
  end

  def sell_in
    @sell_in
  end

  def set_sell_in(value)
    @sell_in += value
  end

  def quality
    @quality
  end

  def set_quality(value)
    @quality += value
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
