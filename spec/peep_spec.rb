require 'peep'

describe Peep do
  describe '.all' do
    it 'contains all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep) VALUES('one');")
    connection.exec("INSERT INTO peeps (peep) VALUES('two');")
    connection.exec("INSERT INTO peeps (peep) VALUES('three');")
      expect(Peep.all).to include 'one'
      expect(Peep.all).to include 'two'
      expect(Peep.all).to include 'three'
    end
  end

  describe '.add' do
    it 'adds a peep' do
      Peep.add('Adding a peep')
      expect(Peep.all).to include 'Adding a peep'
    end
  end
    
  end