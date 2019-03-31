
require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (content) VALUES ('Peep 1');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Peep 2');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Peep 3');")

    peeps = Peep.all

    expect(peeps).to include('Peep 1')
    expect(peeps).to include('Peep 2')
    expect(peeps).to include('Peep 3')
  end

  describe '.create' do
    it 'creates a new Peep' do
      Peep.create(content: 'Test Peep')

      expect(Peep.all).to include 'Test Peep'
    end
  end 
end
