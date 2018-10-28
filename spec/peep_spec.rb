require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES('Knock knock');")

      peeps = Peep.all
      expect(peeps).to include('Knock knock')
    end
  end

  describe '.create' do
      it 'creates a new text' do
        Peep.create(text: 'Hello world')
        expect(Peep.all).to include 'Hello world'
      end
    end
 end
