require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user) }

  describe "#signup" do
    subject { described_class.with(user: user).signup }

    it "works" do
      expect(subject.to).to eq([user.email])
      expect(subject.subject).to be_present
      expect(subject.from).to eq([Rails.application.credentials.default_from_email])
      expect(subject.body).to_not be_present
    end
  end
end
