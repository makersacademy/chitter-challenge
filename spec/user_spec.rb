require_relative '../app/models/user.rb'
require 'dm-rspec'

describe User do
  subject(:user) {described_class.new}
  context "when #properties it" do
    it { should have_property :id}
    it { should have_property :email}
    it { should have_property :name}
    it { should have_property :password_digest}
    it { should have_property :username}


  end
end
