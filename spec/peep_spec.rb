require 'peep'

describe Peep do
  it "creates a peep" do
    peep = Peep.create(text: "Hi, this is a test peep")
    expect(peep.text).to eq "Hi, this is a test peep"
    expect(peep.time).not_to be_empty
  end
end