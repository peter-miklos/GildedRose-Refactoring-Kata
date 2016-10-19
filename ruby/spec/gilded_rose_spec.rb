require "gilded_rose"

describe GildedRose do


  let(:item1) {double(:item1, name: "Tets Item", sell_in: 30, quality: 30,
                              set_sell_in: 30, set_quality: 30)}
  subject(:gilded_rose) {described_class.new([item1])}

  context "#update_quality" do

    it "calls the set_sell_in method on the item" do
      expect(item1).to receive(:set_sell_in).with(any_args)
      gilded_rose.update_quality
    end

    it "calls the set_quality method on the item" do
      expect(item1).to receive(:set_quality).with(any_args)
      gilded_rose.update_quality
    end

    it "calls the name method on the item" do
      expect(item1).to receive(:name)
      gilded_rose.update_quality
    end

    it "calls the sell_in method on the item" do
      expect(item1).to receive(:sell_in)
      gilded_rose.update_quality
    end

    it "calls the quality method on the item" do
      expect(item1).to receive(:quality)
      gilded_rose.update_quality
    end

  end

end
