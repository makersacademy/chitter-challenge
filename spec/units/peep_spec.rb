require "spec_helper"
describe Peep do
  subject(:peep) {described_class.new}
  it "has a message" do
    expect(peep).to respond_to(:message)
  end
  it "has a time of creation" do
    expect(peep).to respond_to(:time)
  end
  it "has one user" do
    expect(peep).to respond_to(:user)
  end
end
