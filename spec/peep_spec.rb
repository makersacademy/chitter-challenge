require 'peep'
require 'database_helpers'

describe Peep do
  describe '#view_all_peeps' do
    it 'returns all peeps' do

    # Add the test data
      peep = Peep.new_peep(message: 'This is a peep')
      Peep.new_peep(message: 'This is another peep')
      Peep.new_peep(message: 'This is a third peep')

      peeps = Peep.view_all_peeps

      expect(peeps.length).to eq 3
      expect(peeps.last).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.message).to eq 'This is a peep'
      expect(peeps.last.created_at).to eq peep.created_at
      expect(peeps[0].created_at > peeps[1].created_at).to eq true
      expect(peeps[1].created_at > peeps[2].created_at).to eq true

    end
  end

  describe '#new_peep' do
    it 'creates a new peep' do
      peep = Peep.new_peep(message: 'Test peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'Test peep'
      expect(peep.created_at).to eq persisted_data['created_at']
    end
  end

  describe '#peep_time' do
    it 'creates a new Time object' do
      peep = Peep.new_peep(message: 'Test peep')

      expect(peep.peep_time).to be_a Time
    end
  end

  describe '#formatted_peep_time' do
    it 'converts peep_time into user friendly time format' do
      peep = Peep.new(id: 9999, message: "Hello world", created_at: '2018-10-27 17:29:45.446675+01', peep_time: Time.new(2018, 10, 27, 17, 29, 45, '+01:00'))

      expect(peep.formatted_peep_time).to eq '05:29PM 27/10/2018'

    end
  end
end
