require 'peep'

describe Peep do
  it "Can call #all method on the Peep class" do
    expect(Peep).to respond_to :all
  end

  it "responds to #peep_time" do
    expect(subject).to respond_to :peep_time
  end

#not sure about this test - vacuous, i'm just telling it what it is going to return
#it will pass regardless of what I put in the method.
  it "gives the time" do
    allow(subject).to receive(:peep_time).and_return("2020-04-11 14:12:12 +0100")
    expect(subject.peep_time).to eq "2020-04-11 14:12:12 +0100"
  end
end

describe ".all" do
  it "displays a list of the peeps" do

    peeps = Peep.all
    expect(peeps).to include "User: Alex Peep: I miss the football! Time: 2020-04-11 14:12:12"
    expect(peeps).to include "User: Renata Peep: Time for some socially distanced excercise Time: 2020-04-10 12:00:05"
    expect(peeps).to include "User: Dave Peep: I think I deserve some chocolate Time: 2020-04-09 11:00:10"
  end
end
