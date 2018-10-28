require 'peep'
#require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')
      connection.exec("INSERT INTO peeps (text,name) VALUES ('Peep 1','Name 1');")
      connection.exec("INSERT INTO peeps (text,name) VALUES ('Peep 2','Name 2');")
      connection.exec("INSERT INTO peeps (text,name) VALUES ('Peep 3','Name 3');")

      bookmarks = Peep.all

      expect(bookmarks).to include("Peep 1, Name 1")
      expect(bookmarks).to include("Peep 2, Name 2")
      expect(bookmarks).to include("Peep 3, Name 3")
    end
  end
end

describe '.add' do
  it 'adds a new peep' do
    peep = Peep.add(text: 'Test Peep', name: 'Test Name').first
    p peep
    expect(peep[:text]).to eq 'Test Peep'
    expect(peep[:name]).to eq 'Test Name'
  end
end
