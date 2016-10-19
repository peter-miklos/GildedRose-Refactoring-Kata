require "item"

describe Item do

  subject(:item1) {described_class.new("Aged Brie", 10, 45)}

  context "#to_s" do
    it "returns the name, sell_in value and quality value in a string" do
      expect(item1.to_s).to eq "Aged Brie, 10, 45"
    end
  end

end
