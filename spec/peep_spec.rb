require_relative '../lib/peep'
require_relative './setting_up_test_database'

describe Peep do
  describe '.all' do
    it 'returns peeps in reverse order' do
      add_three_peeps
      
      peeps = Peep.all

      expect(peeps[2][:content]).to eq 'Chitter is cool!'
      expect(peeps[1][:content]).to eq 'An interesting message..'
      expect(peeps[0][:content]).to eq 'Blah blah blah'
    end
  end

  describe '.create' do
    it 'creates a new peep with the time' do
      time_now = Time.now
      allow(Time).to receive(:now).and_return(time_now)
      formatted_time = time_now.strftime("%I:%M %p, %d/%m/%Y")
      
      Peep.create(content: 'What a day!')

      peeps = Peep.all

      expect(peeps[0][:content]).to eq 'What a day!'
      expect(peeps[0][:posted]).to eq formatted_time
    end
  end
end