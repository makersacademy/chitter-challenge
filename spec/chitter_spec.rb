require "chitter"

describe ".all" do
  it "returns a list of peeps" do
    chitter = Chitter.all
    expect(chitter).to include "Hello"
  end
end
