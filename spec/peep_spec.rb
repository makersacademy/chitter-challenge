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
  end

  describe '#create' do
    it 'inserts a new peep into the database' do
    connection = PG.connect(dbname:'chitter_test')
    peep = Peep.create("This is a new peep")
    peeps = Peep.all
    expect(peeps).to include("This is a new peep")
    end
  end

end
