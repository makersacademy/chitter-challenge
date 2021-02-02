require "peep"

describe '.feed' do
  it 'returns a feed of the peeps' do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO chitter (peep) VALUES ('this is my first peep');")
    connection.exec("INSERT INTO chitter (peep) VALUES ('this is my second peep');")
    connection.exec("INSERT INTO chitter (peep) VALUES ('this is my third peep');")
    peep = Peep.feed
    expect(chitter).to include 'this is my first peep'
    expect(chitter).to include 'this is my second peep'
    expect(chitter).to include 'this is my third peep'
  end
end
  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.new
      peep.create(peep: "this is my first peep")

      expect(peep.feed). to include "this is my first peep"
    end
  end
