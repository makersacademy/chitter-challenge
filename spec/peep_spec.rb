require 'peep'

describe Peep do
  describe '.all' do
    it "returns all peeps" do
      clear_database

      peep = Peep.create(message: "I think")

      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.length).to eq 1
      expect(peeps.first.id).to eq(peep.id)
      expect(peeps.first.message).to eq("I think")
    end
  end

  describe '.create' do
    it "creates a new peep" do
      clear_database

      peep = Peep.create(message: "I think")

      expect(peep).to be_a Peep
      expect(peep.message).to eq "I think"

    end
  end
end
