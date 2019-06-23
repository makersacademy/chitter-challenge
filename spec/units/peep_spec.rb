require "peep"
require 'database_helpers'

describe Peep do

  describe ".create" do
    it "creates a post" do

      peep=Peep.create(text: "This is a test")

      allow(peep).to receive(:date).and_return('10:00:00')

      persisted_data=persisted_data(id: peep.id) #helper method

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq("This is a test")
      expect(peep.date).to eq('10:00:00')

    end
  end


  describe ".all" do
    it "returns a list of all peeps" do
    # connect_to_database = PG.connect(dbname: "chitter_test")
    peep= Peep.create(text: "This is a test")

    peeps= Peep.all
    expect(peeps.length).to eq 1
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.text).to eq "This is a test"
    end
  end
end
