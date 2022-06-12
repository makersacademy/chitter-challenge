require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_chatter_test')

      connection.exec("INSERT INTO peeps (content, user_id) VALUES ('This is my first peep', 'First');")
      connection.exec("INSERT INTO peeps (content, user_id) VALUES ('This is my second peep', 'Second');")
      connection.exec("INSERT INTO peeps (content, user_id) VALUES ('This is my third peep', 'Third');")

      peeps = Peep.all

      expect(peeps).to include("This is my first peep")
      expect(peeps).to include("This is my second peep")
      expect(peeps).to include("This is my third peep")
    end
  end
end
