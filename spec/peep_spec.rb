require './lib/peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.post(body: "My first peep")
      Peep.post(body: "Another peep")
      Peep.post(body: "Hello")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.body).to eq "My first peep"
    end
  end

  describe '.post' do
    it 'posts a new peep' do
      peep = Peep.post(body: 'This is testing post method...')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.body).to eq 'This is testing post method...'
    end
  end

  it 'Posts  new peep with the timestamp' do
    peep = Peep.post(body: 'Test peep for timestamp')
    persisted_data = persisted_data(id: peep.id)

    expect(peep.timestamp).to eq persisted_data.first['timestamp']
  end





end
