require_relative '../../lib/peep.rb'

describe Peep do
  
  context "the peep class wraps rows from the peep table as peeps" do
    it "Peep.all outputs instances of the peep class, populated by the db" do
      peeps = Peep.all
      expect(peeps[0]).to be_instance_of Peep
    end
  end

  context "Peep.create" do
    it "Peep.create writes a peep to the correct database" do
      Peep.create("My first peep")
      content = Peep.all.map { |peep| peep.content }
      expect(content).to include("My first peep")
    end
  end

end