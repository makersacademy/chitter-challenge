require 'peep.rb'

describe Peep do
  describe '.all' do
    it 'returns the list of peeps' do
      connection = PG.connect :dbname => 'chitter_test'

      connection.exec("INSERT INTO peeps (message, user_id, posted_time) VALUES ('Hello!', 'Makers', '27/04/2019');")
      connection.exec("INSERT INTO peeps (message, user_id, posted_time) VALUES ('Groot?', 'Groot', '27/04/2019');")
      connection.exec("INSERT INTO peeps (message, user_id, posted_time) VALUES ('Donut...', 'Homer', '27/04/2019');")

      peeps = Peep.all
      expect(peeps).to include("Hello!")
      expect(peeps).to include("Groot?")
      expect(peeps).to include("Donut...")
    end
  end
end
