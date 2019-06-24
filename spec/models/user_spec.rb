require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: "Example User", email: "user@example.com",
                                password: "foobar", password_confirmation: "foobar") }

  it "should be valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "should be not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "should be not valid with too long name" do
    subject.name = "a" * 51
    expect(subject).to_not be_valid
  end

  it "should be not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "should be not valid with too long email" do
    subject.email = "a" * 254 + "@example.com"
    expect(subject).to_not be_valid
  end

  it "should be valid with valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp
alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      subject.email = valid_address
      expect(subject).to be_valid
    end
  end

  it "should not be valid without valid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com
foo@bar+baz.com]

    invalid_addresses.each do |invalid_address|
      subject.email = invalid_address
      expect(subject).to_not be_valid
    end
  end

  it "should not be valid with duplicated email" do
    duplicate_subject = subject.dup
    duplicate_subject.email = subject.email.upcase
    subject.save
    expect(duplicate_subject).to_not be_valid
  end

  it "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    subject.email = mixed_case_email
    subject.save
    expect(subject.reload.email).to eq(mixed_case_email.downcase)
  end

  it "should not be valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "should not be valid with blank password" do
    subject.password = subject.password_confirmation = " " * 6
    expect(subject).to_not be_valid
  end

  it "shoud not be valid without enough length password" do
    subject.password = subject.password_confirmation = "a" * 5
    expect(subject).to_not be_valid
  end
end
