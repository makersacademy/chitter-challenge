require 'chitter'
require 'database_helper'

describe Chitter do
  before do
    now = Time.parse("2021-07-20 08:00:00")
    allow(Time).to receive(:now) { now }
  end

  describe '.peeps' do
    it 'return all peeps' do
      connection = PG.connect( dbname: 'chitter_test' )

      # add test data
      peep = Chitter.post(message: "Hello world 3")
      Chitter.post(message: "Hello world 4")

      peeps = Chitter.peeps

      expect(peeps.length).to eq(2)
      expect(peeps.first).to be_a(Peep)
      expect(peeps.first.id).to eq(peep.id)
      expect(peeps.first.message).to eq('Hello world 3')
      expect(peeps.first.time).to include('08:00')
    end
  end

  describe '.post' do
    it 'create a new peep' do
      connection = PG.connect( dbname: 'chitter_test' )

      # add test data
      peep = Chitter.post(message: "Hello world 4")
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a(Peep)
      expect(peep.id).to eq(persisted_data['id'])
      expect(peep.time).to include("08:00")
      expect(peep.message).to include('Hello world 4')
    end
  end
end