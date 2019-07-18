require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { create(:item) }

  context "with all valid attributes" do
    it "is valid" do
      expect(subject).to be_valid
    end
  end

  context "when the name attribute is not present" do
    it "is not valid" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it "belongs_to one menu" do
      association = described_class.reflect_on_association(:menu)
      expect(association.macro).to eq :belongs_to
    end

    it "has many orders" do
      association = described_class.reflect_on_association(:order_items)
      expect(association.macro).to eq :has_many
    end

    it "has many orders through order_items" do
      association = described_class.reflect_on_association(:orders)
      expect(association.macro).to eq :has_many
    end
  end
end
