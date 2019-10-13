require 'peep'

describe Peep do
  describe '.create' do
    it "creates a new peep" do
      peep = Peep.create(message: "My first peep")

      expect(peep).to be_a Peep
      expect(peep.message).to eq "My first peep"

    end
  end

  describe '.all' do
    it "returns all peeps in reverse chronological order" do
      peep = Peep.create(message: "My first peep")
      Peep.create(message: "My second peep")
      Peep.create(message: "My third peep")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.message).to eq "My first peep"
      expect(peeps.last.created_at).to eq peep.created_at
    end
  end
end
