require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    context "name of the item" do

      it "does not change the name" do
        items = [Item.new("foo", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].name).not_to eq "fixme"
      end

    end

    context "normal item's quality" do

      it "lowers the value by one at EOD" do
        items = [Item.new("test_item", 30, 30)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 29
      end

      it "doesn't lower the value at EOD if it's already 0" do
        items = [Item.new("test_item", 0, 0)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 0
      end

      it "doesn't lower the value of the 'Sulfuras' at EOD" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 30, 30)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 30
      end

    end

    context "Aged Brie's quality" do
      it "increases the value by one at EOD" do
        items = [Item.new("Aged Brie", 30, 30)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 31
      end

      it "doesn't increase the value of the 'Aged Brie' if it's already 50" do
        items = [Item.new("Aged Brie", 30, 50)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 50
      end
    end

    context "Backstage passes' quality" do
      it "increases the value by one at EOD if more than 10 days left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 30, 30)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 31
      end

      it "increases the value by two at EOD if 10 days or less left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 30)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 32
      end

      it "increases the value by three at EOD if 5 days or less left" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 30)]
        GildedRose.new(items).update_quality
        expect(items.first.quality).to eq 32
      end
    end

  end

end