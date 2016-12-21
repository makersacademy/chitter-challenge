require_relative '../app/models/user.rb'
require 'dm-rspec'
require 'pry'

describe User do
  subject(:user) {described_class.new}
  let!(:user_2) do
    User.create(name: 'Taker', email: 'taker@taker.com', username: 'taker', password: '12345')
  end
  context "when #properties it" do
    it { should have_property :id}
    it { should have_property :email}
    it { should have_property :name}
    it { should have_property :password_digest}
    it { should have_property :username}
  end
  context "when #login it" do
    it "should authenticate with the proper credentials" do
      authenticated_user = User.authenticate('taker', '12345')
      expect(authenticated_user).to eq user_2

    end
    it "should not authenticate when given the wrong password" do
      expect(User.authenticate('taker', 'wrong_password')).to be_nil
    end
  end
end
