require 'peep'
require 'setup_test_database'

describe Peep do
  describe '.all' do
    it 'lists all peeps in table' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (timestamp, post) VALUES (NOW(), 'this is a test message');")
      connection.exec("INSERT INTO peeps (timestamp, post) VALUES (NOW(), 'this is another test message');")
      all_peeps = Peep.all
      expect(all_peeps).to include 'this is a test message'
      expect(all_peeps).to include 'this is another test message'
    end
  end

  describe '.add' do
    it 'is able to create a new peep' do
      Peep.add(post: 'This is a test peep to check the add functionality!')
      expect(Peep.all).to include 'This is a test peep to check the add functionality!'
    end
  end
end