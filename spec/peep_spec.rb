require 'pg'
require './lib/peep'

describe Peep do

  subject(:peep) { described_class.new(1, "Hello World!", "Marianne", "marianneoco", "09:00") }

  it "can create a new peep" do
    expect(peep).to be_instance_of(Peep)
  end

  it "can create a new peep with an id" do
    expect(peep.id).to eq(1)
  end

  it "can create a new peep with content" do
    expect(peep.content).to eq("Hello World!")
  end

  it "has name of peep poster" do
    expect(peep.author_name).to eq("Marianne")
  end

  it "has user handle of the peep poster" do
    expect(peep.author_handle).to eq("marianneoco")
  end

  it "shows the time the peep was posted" do
    expect(peep.time).to eq("09:00")
  end

end
