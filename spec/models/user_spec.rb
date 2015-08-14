require "spec_helper"

describe User do
  let(:monkey) { create :user }
  context "authenticates" do
    it "when given a valid email and password" do
      user = User.authenticate(monkey.email, monkey.password)
      expect(user).to eq monkey
    end
  end
  context "doesn't authenticate" do
    it "when given incorrect email" do
      user = User.authenticate("Navigator@strawhats.com", monkey.password)
      expect(user).to eq nil
    end
    it "when given incorrect password" do
      user = User.authenticate(monkey.email, "treasure")
      expect(user).to eq nil
    end
  end
end