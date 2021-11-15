require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do

    connection = PG.connect(dbname: 'chitter_test')

    # add test data
    connection.exec("INSERT INTO peeps VALUES(1, 'This is the first peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is the second peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'This is the third peep');")

      peeps = Peep.all

    expect(peeps).to include('This is the first peep')
    expect(peeps).to include('This is the second peep')
    expect(peeps).to include('This is the third peep')
    end
  end
end
