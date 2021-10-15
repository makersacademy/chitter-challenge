require 'peep'
require 'database_helpers'
require 'timecop'

describe Peep do
  after { Timecop.return } # resets the time to real time

  describe '.all' do
    it 'returns an array of all peeps' do
      Peep.create(text: 'Other tweet')
      Peep.create(text: 'Another tweet')
      peep = Peep.create(text: 'Test tweet')
      
      expect(Peep.all.length).to eq(3)
      expect(Peep.all.first.id).to eq peep.id
      expect(Peep.all.first.text).to eq 'Test tweet'
      # storing peep time isn't tested here as it is tested elsewhere
    end

    it 'is sorted by newest first' do
      [2019,2020,2021].each do |year|
        Timecop.freeze(Time.utc(year))
        Peep.create(text: "Test tweet #{year}")
      end

      expect(Peep.all.first.time).to eq Timecop.freeze(Time.utc(2021))
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      time = Timecop.freeze(Time.utc(2021))
      peep = Peep.create(text: 'Test tweet')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'Test tweet'
      expect(peep.time).to eq time
    end
  end
end
