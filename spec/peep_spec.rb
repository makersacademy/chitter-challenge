require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')
      connection.exec("INSERT INTO peeps (text) VALUES ('Peep 1');")
      connection.exec("INSERT INTO peeps (text) VALUES ('Peep 2');")
      connection.exec("INSERT INTO peeps (text) VALUES ('Peep 3');")

      bookmarks = Peep.all

      expect(bookmarks).to include("Peep 1")
      expect(bookmarks).to include("Peep 2")
      expect(bookmarks).to include("Peep 3")
    end
  end
end

describe '.add' do
  it 'adds a new peep' do
    Peep.add(text: 'Test Peep')
    expect(Peep.all).to include 'Test Peep'
  end
end
