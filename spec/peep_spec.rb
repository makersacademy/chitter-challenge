require 'peep'

describe Peep do
  it "Can call #all method on the Peep class" do
    expect(Peep).to respond_to :all
  end
end

describe ".all" do
  it "displays a list of the peeps" do
    peeps = Peep.all
    expect(peeps).to include "I miss the football!"
    expect(peeps).to include "Time for some socially distanced excercise"
    expect(peeps).to include "I think I deserve some chocolate"
  end
end
