require 'peep'

describe Peep do 
  describe '.all' do 
    it 'displays all the peepes in the database' do
      DatabaseConnection.setup('chitter_test')
      expect(Peep.all.length).to eq 1
    end 
  end 

  describe '.add' do 
    it 'adds a peep to the database' do
      expect(DatabaseConnection).to receive(:query).with("INSERT INTO peeps (peep) VALUES 'Hey how it do'")
      Peep.add('Hey how it do') 
    end 
  end 
end 