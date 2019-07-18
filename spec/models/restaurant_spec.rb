require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  subject { build(:restaurant) }

  context "with all valid attributes" do
    it "is valid" do
      expect(subject).to be_valid
    end
  end

  context 'when the name attribute is not present' do
    it 'is not valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'when the address attribute is not present' do
    it 'is not valid' do
      subject.address = nil
      expect(subject).to_not be_valid
    end
  end
end
