require "peep"
require_relative "./setup_test_database.rb"

describe Peep do
  describe ".all" do
    it "returns all Peeps" do
      connection = PG.connect(dbname: "chitter_test")
  
      chit_stream = Peep.create(msg: "This is a peep test")
      Peep.create(msg: "This is a peep test")
      Peep.create(msg: "This is a peep test")
  
      peeps = Peep.all
  
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq chit_stream.id
      expect(peeps.first.msg).to eq "This is a peep test"
    end
  end


end
