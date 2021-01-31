require 'pg'

describe Peep do

  describe '#all' do

    it 'returns all peeps in database' do
    connection = PG.connect(dbname:'chitter_test')

    connection.exec("INSERT INTO peeps (content) VALUES ('This is my first peep');")
    connection.exec("INSERT INTO peeps (content) VALUES ('Here is some more info about me you do not care about!');")
    connection.exec("INSERT INTO peeps (content) VALUES ('oh look some more lol');")

    peeps = Peep.all

    expect(peeps).to include('This is my first peep')
    expect(peeps).to include('Here is some more info about me you do not care about!')
    expect(peeps).to include('oh look some more lol')
    end

    it 'returns all peeps in reverse chronological order' do
    PG.connect(dbname:'chitter_test')

    Peep.create('This is peep 1')
    Peep.create('This is peep 2')
    Peep.create('This is peep 3')

    peeps = Peep.all

    expect(peeps.first).to eq('This is peep 3')
    expect(peeps.last).to eq('This is peep 1')
    end
  end

  describe '#create' do

    it 'creates a new peep' do
    connection = PG.connect(dbname:'chitter_test')
    peep = Peep.create(content: 'This is a test peep', time: '15:23')

    expect(peep['content']).to eq('This is a test peep')
    expect(peep['time']).to eq('15:23')
    end
  end

end
