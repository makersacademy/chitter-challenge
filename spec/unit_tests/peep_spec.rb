require 'model/peep.rb'
require 'database_helpers'

describe Peep do
  describe ".all" do
    it "returns a list of Peep objects" do
      peep = Peep.create(peep: "I realize now that I should have named this field content")
      Peep.create(peep: "Some other string")

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.peep).to eq("I realize now that I should have named this field content")
    end
  end

  describe ".create" do
    it "creates a new peep" do
      peep = Peep.create(peep: "I realize now that I should have named this field content")
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep). to eq persisted_data['peep']
    end
  end

  describe ".peeptime" do
    it "returns the peeptime of each peep" do
      test_time = double'test time'
      allow_any_instance_of(Peep).to receive(:peeptime).and_return(test_time)
      test_peep = Peep.create(peep: '')
      expect(test_peep.peeptime).to eq(test_time)
    end
  end
end
