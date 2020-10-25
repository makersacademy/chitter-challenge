require_relative '../../lib/chitter.rb'
require 'pg'
describe Peep do
  let(:time) { Time.now.strftime("%H:%M:%S") }
  describe '.all' do
    it 'returns all the peeps' do
      Peep.create(peep: 'I saw twelve chickens in the park earlier', time: time)
      Peep.create(peep: 'There are 9 million bicycles in Beijing', time: time)
      expect(Peep.all).to include('There are 9 million bicycles in Beijing')  
      expect(Peep.all).to include('I saw twelve chickens in the park earlier')    
    end
  end
  describe '.create' do
    it 'returns the inputted peep' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time).first
      expect(new_peep['peep']).to eq('Hey, how are ya?')
    end
    it 'returns the time the peep was created' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time).first
      expect(new_peep['post_time']).to eq(time)
    end
  end
end

