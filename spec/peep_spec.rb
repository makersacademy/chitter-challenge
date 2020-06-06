require 'peep'

describe Peep do

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (content) VALUES('i need a holiday');")
    connection.exec("INSERT INTO peeps (content) VALUES('look at my cat');")
    connection.exec("INSERT INTO peeps (content) VALUES('HUNGRY');")

    peeps = Peep.all

    expect(peeps).to include 'i need a holiday'
    expect(peeps).to include 'look at my cat'
    expect(peeps).to include 'HUNGRY'

    end
  end


  describe '.create' do
  it 'creates a new peep' do
    Peep.create(content: 'meow')

    expect(Peep.all).to include 'meow'
  end
end

end
