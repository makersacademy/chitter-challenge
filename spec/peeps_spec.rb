require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep) VALUES ('This is my last peep');")
    connection.exec("INSERT INTO peeps (peep) VALUES('I am bored');")
    connection.exec("INSERT INTO peeps (peep) VALUES('This is my first peep');")

    peeps = Peeps.all

      expect(peeps).to include("This is my last peep")
      expect(peeps).to include("I am bored")
      expect(peeps).to include("This is my first peep")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(peep: 'This is my first peep')
  
      expect(Peeps.all).to include 'This is my first peep'
    end
  end

end