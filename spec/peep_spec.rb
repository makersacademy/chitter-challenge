require_relative '../models/peep'

describe Peep do
  let(:subject) { Peep.create({ description: "This is a test peep" }) }
  it { expect(subject).to be_a Peep }

  it "has a description" do
    expect(subject.description).to eq "This is a test peep"
  end
end
