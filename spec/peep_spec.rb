require 'peep'

describe Peep do
  it "creates a peep" do
    peep = Peep.create(text: "Hi, this is a test peep")
    expect(peep.text).to eq "Hi, this is a test peep"
    expect(peep.time).not_to be_empty
  end

  it "list all the peeps" do
    Peep.create(text: "I was created before everybody")
    Peep.create(text: "I am a test peep!")
    peep = Peep.create(text: "I am the last peep")

    peeps = Peep.all

    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.text).to eq "I am the last peep"
  end
end
