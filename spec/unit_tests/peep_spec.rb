require 'model/peep.rb'

describe Peep do
  it "can store and retrieve peeps from the database" do
    Peep.create(peep: "I realize now that I should have named this field content")
    expect(Peep.all).to include("I realize now that I should have named this field content")
  end
  it "returns peeps in reverse chronological order" do
    Peep.create(peep: 'last')
    Peep.create(peep: 'third')
    Peep.create(peep: 'second')
    Peep.create(peep: 'first')
    expect(Peep.all).to eq(['first', 'second', 'third', 'last'])
  end
end
