require 'user'

describe User do
  it "responds to #create" do
    expect(User).to respond_to(:create).with(4).argument
  end
end
