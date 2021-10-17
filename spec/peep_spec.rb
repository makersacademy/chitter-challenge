require 'peep'

describe Peep do
  describe '.create' do
    it 'allows you to create new Peeps' do
      peep = Peep.create(content: 'I am a great Peep')
      expect(peep.content).to eq 'I am a great Peep'
    end 
  end 

  describe '.all' do
    it 'returns a list of Peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      #Add the test data
      connection.exec("INSERT INTO peeps (content) VALUES ('I am a great Peep');")
      connection.exec("INSERT INTO peeps (content) VALUES ('I am another Peep');")
      peeps = Peep.all
      expect(peeps.first.content).to eq 'I am a great Peep'
      expect(peeps[1].content).to eq 'I am another Peep'
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep  
    end
  end
end