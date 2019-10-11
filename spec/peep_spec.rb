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
    it "returns all peeps" do
      peep = Peep.create(message: "My first peep")
      Peep.create(message: "My second peep")
      Peep.create(message: "My third peep")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq "My first peep"
      expect(peeps.first.created_at).to eq peep.created_at
    end
  end
end
