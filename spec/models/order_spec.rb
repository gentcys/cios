require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { create(:order) }

  context 'with all valid attributes' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to one user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many order_items' do
      association = described_class.reflect_on_association(:order_items)
      expect(association.macro).to eq :has_many
    end

    it 'has many items through order_items' do
      association = described_class.reflect_on_association(:items)
      expect(association.macro).to eq :has_many
    end
  end
end
