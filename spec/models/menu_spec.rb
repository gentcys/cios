require 'rails_helper'

RSpec.describe Menu, type: :model do
  subject { create(:menu) }

  context 'with all valid attributes' do
    it 'is valid' do
      expect(subject).to be_valid
    end
  end

  context 'when name attribute is not present' do
    it 'is not valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'belongs to one restaurant' do
      association = described_class.reflect_on_association(:restaurant)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many items' do
      association = described_class.reflect_on_association(:item)
      expect(association.macro).to eq :has_many
    end
  end
end
