require 'peeps'
require 'database_helpers'

describe Peeps do
  describe '.create' do
    it 'creates a new peep' do
      time = Time.now
      peep = Peeps.create(message: "Test",time: time)
      persisted_data = persisted_data(id: peep.id, table: 'peep')

      expect(peep.message).to eq "Test"
      expect(peep.id).to eq persisted_data.first['id']
    end

    it 'time works' do
      fixed = Time.new(2020,1,1,12,0,0)
      allow(Time).to receive(:now).and_return(fixed)

      expect(Time.now).to eq fixed
      expect(Time.now.to_s).to eq('2020-01-01 12:00:00 +0000')
    end

    it 'time works when used with .create' do
      Time_fake = double('Time_fake')
      fixed = Time.new(2020,1,1,12,0,0)
      allow(Time_fake).to receive(:now).and_return(fixed)
      peep = Peeps.create(message: "Test",time: Time_fake.now)
      persisted_data = persisted_data(id: peep.id, table: 'peep')

      expect(peep.time).to eq persisted_data.first['time']
    end
  end

    describe '.all' do
      it 'returns all peeps' do
        time = Time.now
        Peeps.create(message: "Another Test",time: time )
        Peeps.create(message: "Different Test",time: time)
        peeps = Peeps.all

      expect(peeps.length).to eq 2
    end
  end
end
