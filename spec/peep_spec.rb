require_relative '../lib/peep'
require_relative './database_helpers'

describe Peep do
  describe '.all' do
    it 'returns peeps in reverse order' do
      peep = Peep.create(content:'Chitter is cool!')
      Peep.create(content:'An interesting message..')
      Peep.create(content:'Blah blah blah')

      peeps = Peep.all

      expect(peeps[2].content).to eq 'Chitter is cool!'
      expect(peeps[2]).to be_a Peep
      expect(peeps[2].id).to eq peep.id
      expect(peeps[1].content).to eq 'An interesting message..'
      expect(peeps[0].content).to eq 'Blah blah blah'
    end
  end

  describe '.create' do
    it 'creates a new peep with the time' do
      time_now = Time.now
      allow(Time).to receive(:now).and_return(time_now)
      formatted_time = time_now.strftime("%I:%M %p, %d/%m/%Y")
      
      peep = Peep.create(content: 'What a day!')
      persisted_data = persisted_data(table: 'peeps', id: peep.id)
      
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq 'What a day!'
      expect(peep.posted).to eq formatted_time
    end
  end
end