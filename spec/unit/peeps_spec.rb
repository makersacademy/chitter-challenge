require 'peeps'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep_text) VALUES ('Every application somehow needs PosgreSQL');")
      peeps = Peep.all

      expect(peeps).to include('Every application somehow needs PosgreSQL')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Peep.create(peep_text: 'Every application somehow needs PosgreSQL')

      expect(Peep.all).to include 'Every application somehow needs PosgreSQL'
    end
  end

end