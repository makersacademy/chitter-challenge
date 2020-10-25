require_relative '../../lib/peep.rb'
require 'pg'
describe Peep do
  let(:time) { Time.now.strftime("%H:%M:%S") }
  let(:name) { 'Jane Doe' }
  let(:username1) { 'JDoggyDog' }
  let(:name2) { 'Alfred Wilson' }
  let(:username2) { 'ACat101 '}
  describe '.all' do
    it 'returns all the peeps' do
      Peep.create(peep: 'I saw twelve chickens in the park earlier', time: time, name: name, username: username1)
      Peep.create(peep: 'There are 9 million bicycles in Beijing', time: time, name: name2, username: username2)
      chitter_feed = Peep.all
      expect(chitter_feed.length).to eq 2   
    end

    it 'can access the id, name, username and time of the peep' do
      Peep.create(peep: 'I saw twelve chickens in the park earlier', time: time, name: name, username: username1)
      posted_peep = Peep.create(peep: 'There are 9 million bicycles in Beijing', time: time, name: name2, username: username2)

      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq posted_peep.id
      expect(peeps.first.time).to eq time # may need re thinking
      expect(peeps.first.peep).to eq 'There are 9 million bicycles in Beijing'
      expect(peeps.first.name).to include('Alfred Wilson') 
      expect(peeps.first.username).to include('ACat101')  
    end
  end

  describe '.create' do
    it 'returns the inputted peep' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time, name: name, username: username1)
      expect(new_peep.peep).to eq('Hey, how are ya?')
    end

    it 'returns the time the peep was created' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time, name: name, username: username1)
      expect(new_peep.time).to eq(time)
    end

    it 'returns the name the peep was created by' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time, name: name, username: username1)
      expect(new_peep.name).to eq('Jane Doe')
    end

    it 'returns the username the peep was created by' do
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time, name: name, username: username1)
      expect(new_peep.username).to eq('JDoggyDog')
    end
  end
end