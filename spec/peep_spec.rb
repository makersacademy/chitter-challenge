require 'pg'
require './lib/peep'

describe Peep do

  it "can create a new peep" do
    peep = Peep.new("Hello World!")
    expect(peep).to be_instance_of(Peep)
  end

  it "can create a new peep with content" do
    peep = Peep.new("Hello World!")
    expect(peep.content).to eq("Hello World!")
  end

  it "has a default name of the peep poster" do
    peep = Peep.new("Hello World!")
    expect(peep.author_name).to eq("Marianne")
  end

  it "has a default user handle of the peep poster" do
    peep = Peep.new("Hello World!")
    expect(peep.author_handle).to eq("marianneoco")
  end

  #it "shows the time the peep was posted" do

  #end


end
