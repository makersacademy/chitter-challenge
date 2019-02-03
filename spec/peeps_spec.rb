require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/lib/peeps.rb'
require 'pg'


describe Peep do
  describe '.all' do
    it 'Shows a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peep VALUES(1, 'First peep woo')")

      peep = Peep.all
      expect(peep).to include('First peep woo')
    end
  end

  describe '.create' do
    it 'adds a peep' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peep VALUES(2, 'second peep')")
    end
  end 
end
