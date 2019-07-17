require './models/peep'

describe Peep do

  describe '#.all' do
    it 'returns all bookmarks' do

    connection = PG.connect(dbname: 'peep_manager_test')
    # add the test data
    connection.exec("INSERT INTO peeps (peep) VALUES('hello');")
    connection.exec("INSERT INTO peeps (peep) VALUES('mike');")
    peeps = Peep.all
    
    expect(peeps).to include("hello")
    expect(peeps).to include("mike")
    end
  end

  describe '#.post' do
    it 'allows you to post a new peep to chitter' do
      expect(Peep.add("first peep!")).to be_a Peep
    end
  end
end
  