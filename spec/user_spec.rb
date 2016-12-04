require_relative '../app/models/user.rb'
require 'dm-rspec'

describe User do
  subject(:user) {described_class.new}
  let(:user_2) do
    User.create(username: 'maker', password: '12345')
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
      authenticated_user = user_2.authenticate('maker', '12345')
      expect(user_2).to eq authenticated_user
    end
  end
end
