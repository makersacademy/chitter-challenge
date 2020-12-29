require 'cheep'

describe Cheep do
  describe '.all' do
    it 'returns all cheeps' do
      connection = PG.connect(dbname: 'cheeps_test_database')

      connection.exec("INSERT INTO cheeps VALUES(1, 'Jason', 'First cheep');")
      connection.exec("INSERT INTO cheeps VALUES(2, 'Lisa', 'Second cheep');")
      connection.exec("INSERT INTO cheeps VALUES(3, 'Zoe', 'Third cheep');")

      cheeps = Cheep.all

      expect(cheeps).to include("First cheep")
      expect(cheeps).to include("Second cheep")
      expect(cheeps).to include("Third cheep")
    end
  end


describe '.create' do
  it 'creates a new cheep' do
    Cheep.create(message: 'This is the .create test')

    expect(Cheep.all).to include 'This is the .create test'
  end
end
end