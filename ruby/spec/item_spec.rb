require "item"

describe Item do

  subject(:item1) {described_class.new("Test Item", 10, 45)}

  context "#name" do
    it "returns the name of the item" do
      expect(item1.name).to eq "Test Item"
    end
  end

  context "#sell_in" do
    it "returns the sell_in value" do
      expect(item1.sell_in).to eq 10
    end
  end

  context "#set_sell_in" do
    it "lowers the sell_in value by one if -1 received" do
      expect{item1.set_sell_in(-1)}.to change{item1.sell_in}.from(10).to(9)
    end
  end

  context "#quality" do
    it "returns the quality value" do
      expect(item1.quality).to eq 45
    end
  end

  context "#set_quality" do
    it "lowers the quality value by one if -1 received" do
      expect{item1.set_quality(-1)}.to change{item1.quality}.from(45).to(44)
    end

    it "decrease the quality value by two if 2 received" do
      expect{item1.set_quality(1)}.to change{item1.quality}.from(45).to(46)
    end
  end

  context "#to_s" do
    it "returns the name, sell_in value and quality value in a string" do
      expect(item1.to_s).to eq "Test Item, 10, 45"
    end
  end

end
