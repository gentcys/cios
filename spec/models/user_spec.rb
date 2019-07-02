require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Example User", email: "user@example.com",
                                password: "foobar", password_confirmation: "foobar") }

  context "with all valid attributes" do
    it "is valid" do
      expect(subject).to be_valid
    end
  end

  context "when the name is not present" do
    it "is not valid" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context "when the length of name is too long" do
    it "is not valid" do
      subject.name = "a" * 51
      expect(subject).to_not be_valid
    end
  end

  context "when the email is not present" do
    it "is not valid" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context "when the length of email is too long" do
    it "is not valid" do
      subject.email = "a" * 254 + "@example.com"
      expect(subject).to_not be_valid
    end
  end

  context "with correct format of email address" do
    it "is valid" do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp
alice+bob@baz.cn]

      valid_addresses.each do |valid_address|
        subject.email = valid_address
        expect(subject).to be_valid
      end
    end
  end

  context "without correct format of email address" do
    it "is not valid" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com
foo@bar+baz.com]

      invalid_addresses.each do |invalid_address|
        subject.email = invalid_address
        expect(subject).to_not be_valid
      end
    end
  end

  context "with an duplicated email" do
    it "is not valid" do
      duplicate_subject = subject.dup
      duplicate_subject.email = subject.email.upcase
      subject.save
      expect(duplicate_subject).to_not be_valid
    end
  end

  context "email address with upper case character" do
    it "is saved as lower case" do
      mixed_case_email = "Foo@ExAMPle.CoM"
      subject.email = mixed_case_email
      subject.save
      expect(subject.reload.email).to eq(mixed_case_email.downcase)
    end
  end

  context "without password" do
    it "is not valid" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

  context "with an blank password" do
    it "is not valid" do
      subject.password = subject.password_confirmation = " " * 6
      expect(subject).to_not be_valid
    end
  end

  context "without enough length password" do
    it "is not valid" do
      subject.password = subject.password_confirmation = "a" * 5
      expect(subject).to_not be_valid
    end
  end
end
