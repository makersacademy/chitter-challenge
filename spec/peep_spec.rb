require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do

      connection = PG.connect(dbname: 'chitter_db_test')

      connection.exec("INSERT INTO peeps (message_content) VALUES ('Test peep content');")

      peeps = Peep.all

      expect(peeps).to include("Test peep content")
    end
  end
end
