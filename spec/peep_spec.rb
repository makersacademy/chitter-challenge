require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.create(content: "just setting up my chttr")
      Peep.create(content: "Another peep from another user")

      peeps = Peep.all

      expect(peeps.first.content).to eq ("just setting up my chttr")
      
    end
  end

  describe '.create' do
    it 'creates a new peep with content' do
      peep = Peep.create(content: "just setting up my chttr")
      expect(peep).to be_a Peep
      expect(peep.content).to eq "just setting up my chttr"
    end
  end
end