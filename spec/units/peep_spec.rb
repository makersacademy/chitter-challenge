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
      peeps = Peep.all
      
      expect(peeps.length).to eq(3)
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'Test tweet'
      # storing peep time isn't tested here as it is tested elsewhere
    end

    it 'is sorted in reverse chronological order' do
      [2019,2020,2021].each do |year|
        Timecop.freeze(Time.utc(year))
        Peep.create(text: "Test tweet #{year}")
      end
      peeps = Peep.all

      expect(peeps.first.time).to eq Timecop.freeze(Time.utc(2021))
      expect(peeps.first.text).to eq "Test tweet 2021"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      time = Timecop.freeze(Time.utc(2021))
      peep = Peep.create(text: 'Test tweet')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)
      # persisted_data queries the database and checks what is actually stored

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.text).to eq 'Test tweet'
      expect(peep.time).to eq time
    end
  end
end
