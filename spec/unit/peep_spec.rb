require_relative '../../lib/peep.rb'

describe Peep do
  
  context "the peep class wraps rows from the peep table as peeps" do

  end

  context "Peep.create" do
    it "Peep.create writes a peep to the correct database" do
      Peep.create("My first peep")
      expect(Peep.all).to include("My first peep")
    end
  end

end