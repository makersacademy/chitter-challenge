require 'peep'

describe Peep do
  it "Can call #all method on the Peep class" do
    expect(Self).to respond_to :all
  end

  it "shows all the peeps" do
    expect(self.all).to include "I miss the football!"
  end
end
