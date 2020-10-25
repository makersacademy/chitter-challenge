require_relative '../../lib/chitter.rb'
require 'pg'
describe Peep do
  describe '.all' do
    it 'returns all the peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('I saw twelve chickens in the park earlier');")
      connection.exec("INSERT INTO peeps (peep) VALUES('There are 9 million bicycles in Beijing');")
      expect(Peep.all).to include('I saw twelve chickens in the park earlier')    
    end
  end
  describe '.create' do
    it 'returns the inputted peep' do
      new_peep = Peep.create(peep: 'Hey, how are ya?').first
      expect(new_peep['peep']).to eq('Hey, how are ya?')
    end
    it 'returns the time the peep was created' do
      time = Time.now.strftime("%H:%M:%S")
      new_peep = Peep.create(peep: 'Hey, how are ya?', time: time).first
      expect(new_peep['post_time']).to eq(time)
    end
  end
  #the .create method to return the values
end

