require "chitter"

describe ".all" do
  it "returns a list of peeps" do
    chitter = Chitter.all
    expect(chitter).to include "Hello"
  end
end
#this test isnt working, dont know why or how to fix it
