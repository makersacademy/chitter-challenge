require_relative '../../lib/chitter.rb'
require 'pg'
describe Peep do
  let(:time) { Time.now.strftime("%H:%M:%S") }
  describe '.all' do
    it 'returns all the peeps' do
      Peep.create(peep: 'I saw twelve chickens in the park earlier', time: time)
      Peep.create(peep: 'There are 9 million bicycles in Beijing', time: time)
      chitter_feed = Peep.all
      # expect(chitter_feed.first.peep).to include('There are 9 million bicycles in Beijing')  
      expect(chitter_feed.first.peep).to include('I saw twelve chickens in the park earlier')    
    end

    it 'can access the id and time of the peep' do
      posted_peep = Peep.create(peep: 'I saw twelve chickens in the park earlier', time: time)
      Peep.create(peep: 'There are 9 million bicycles in Beijing', time: time)

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq posted_peep.id
      expect(peeps.first.time).to eq time #may need re thinking
      expect(peeps.first.peep).to eq 'I saw twelve chickens in the park earlier'
    end
  end

  describe '.create' do
    it 'returns the inputted peep' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time)
      expect(new_peep.peep).to eq('Hey, how are ya?')
    end

    it 'returns the time the peep was created' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time)
      expect(new_peep.time).to eq(time)
    end
  end
end

