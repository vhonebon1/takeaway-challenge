require './docs/order.rb'

describe Order do

let(:order) { described_class.new }

  describe "#initialize" do
    it "should start with an empty total basket" do
      expect(order.total_basket).to eq({})
    end

    it "should start with a list of the food from the menu" do
      expect(order.menu).not_to eq(nil)
    end
  end

  describe "#add_dish" do
    context "when the item is on the menu"
      it "should add an item to the basket" do
        order.add_dish("gyoza")
        expect(order.total_basket).to include {"gyoza"}
      end

    context "when the item is not on the menu" do
      it "should raise and error and prevent adding" do
        expect{ order.add_dish("noodles", 1) }.to raise_error("Item not on the menu!")
      end
    end
  end

  describe "#display_total" do
  it "should show the bill to the customer" do
    allow(order).to receive(:calculate_total).and_return("26.0")
    expect(order.display_total).to eq("Your bill comes to £26.0")
  end
end

  describe "#confirm_order"  do
    before do
      allow($stdin).to receive(:gets).and_return('Yes')
    end
    it "returns a confirmation message for the customer" do
      answer = $stdin.gets
      expect(answer).to eq('Yes')
    end
  end

end
