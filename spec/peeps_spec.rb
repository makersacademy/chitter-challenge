require 'peep'
require 'database_helpers'
require 'database_connection'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(text: "First peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"))
      Peep.create(text: "Second peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"))
      Peep.create(text: "Third peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"))

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'First peep text test'
      expect(peeps.first.posted_time).to eq peep.posted_time
    end
  end

  describe '.create' do
    it 'create a new peep' do
      peep = Peep.create(text: "First peep text test", posted_time: (Time.now).strftime("%d/%m/%Y %H:%M"))
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq "First peep text test"
    end
  end

end
