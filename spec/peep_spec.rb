require_relative '../models/peep'

describe Peep do
  it "can create peeps" do
    subject = Peep.create({ description: "This is a test peep" })
    peeps = Peep.all
    expect(peeps.first).to eq subject
  end

  it "has a description" do
    subject = Peep.create({ description: "This is a test peep" })
    expect(subject.description).to eq "This is a test peep"
  end

  it "cannot create peeps with an empty description" do
    Peep.create({ description: "" })
    expect(Peep.all).to be_empty
  end
end
