require 'spec_helper'

describe User do
  before do
    @user = User.new(name: 'bobross', email: "bobross@mail.com")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  context "when name is not present" do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  context "when name is too long" do
    before { @user.name = 'a' * 31 }
    it { should_not be_valid }
  end

  context "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,bar user.foo user@foo.]
      addresses.each { |address|
        @user.email = address
        expect(@user).not_to be_valid
      }
    end
  end

  context "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.bar a+b@a.com bobross...1@a.b.c]
      addresses.each { |address|
        @user.email = address
        expect(@user).to be_valid
      }
    end
  end

  context "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
end
