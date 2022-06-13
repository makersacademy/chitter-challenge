require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(
        name: "Dack Jorsey",
        username: "dack",
        content: "just setting up my chttr"
      )
      peep = Peep.create(
        name: "Dave K",
        username: "davek87",
        content: "Another tweet by a different user"
      )

      peeps = Peep.all

      expect(peeps.first.content).to eq ("just setting up my chttr")
      expect(peeps.last.content).to eq ("Another tweet by a different user")
    end
  end

  describe '.create' do
    it 'creates a new peep with content' do
      peep = Peep.create(
        name: "Dack Jorsey",
        username: "dack",
        content: "just setting up my chttr"
      )
      expect(peep).to be_a Peep
      expect(peep.content).to eq "just setting up my chttr"
    end

    it 'creates a new peep with content, name, and username' do
      peep = Peep.create(
        name: "Dack Jorsey",
        username: "dack",
        content: "just setting up my chttr"
      )

      expect(peep).to be_a Peep
      expect(peep.content).to eq "just setting up my chttr"
      expect(peep.name).to eq "Dack Jorsey"
      expect(peep.username).to eq "dack"
    end

    it 'timestamps each new peep' do
      peep = Peep.create(
        name: "Dack Jorsey",
        username: "dack",
        content: "just setting up my chttr"
      )
      time = "#{Time.now.strftime("%k:%M")} - #{Time.now.strftime("%d/%m/%Y")}"
      expect(peep.timestamp).to eq time
    end
  end
end