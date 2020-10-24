require 'model/peep.rb'

describe Peep do
  it "can retrieve peeps from the database" do
    expect(Peep.all).not_to be_empty
  end
  it "can store peeps in the database" do
    Peep.create(peep: "I realize now that I should have named this field content")
    expect(Peep.all).to include("I realize now that I should have named this field content")
  end
end
