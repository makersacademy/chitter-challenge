require 'pg'
require 'data_helpers'
require 'peep'

describe Peep do
  uktime = Time.now.strftime("%d %^b %Y, %H:%M")
  describe '.all' do
    it 'can view peeps in reverse chronological order' do
      peep = Peep.create(content: 'My first peep!', time: uktime)
      Peep.create(content: 'Hello, World', time: uktime)
      Peep.create(content: 'Let me tell you something about Chitter..', time: uktime)

      peeps = Peep.all.reverse

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.time).to eq uktime
      expect(peeps.first.content).to eq "My first peep!"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(content: 'I am a new peep', time: uktime)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'I am a new peep'
      expect(peep.time).to eq uktime
    end
  end
end
