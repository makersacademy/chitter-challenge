require 'peep'

describe Peep do
  subject(:peep) { described_class.new }
  context do
    connection = PG.connect(dbname: 'chitter_test')

    describe 'all' do
      # test data
      connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 1');")
      connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 2');")
      connection.exec("INSERT INTO peeps(peep) VALUES('This is peep 3');")

      it 'returns a list of all bookmarks' do
        peeps = Peep.all
        expect(peeps).to include "This is peep 1"
        expect(peeps).to include "This is peep 2"
        expect(peeps).to include "This is peep 3"
      end
    end

    describe 'add' do
      it 'adds a new bookmark' do
        Peep.add(peep: 'This is a new peep')
        expect(Peep.all).to include "This is a new peep"
      end
    end
  end
end
