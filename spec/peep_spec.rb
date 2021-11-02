require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Whats up Chitter');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('What do you want to say?');")
    connection.exec("INSERT INTO peeps (peep) VALUES ('I am hungry');")
    
    peeps = Peep.all 
    
    expect(peeps).to include("Whats up Chitter")
    expect(peeps).to include("What do you want to say?")
    expect(peeps).to include("I am hungry")
    
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(peep: 'Hi there!')

      expect(Peep.all).to include 'Hi there!'
    end
  end

end


