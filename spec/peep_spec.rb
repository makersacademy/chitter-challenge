require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitter (id, username, text) VALUES ('1', 'johndoe', 'This is the first peep');")
      connection.exec("INSERT INTO chitter (id, username, text) VALUES ('2', 'johndoe', 'This is the second peep');")
      connection.exec("INSERT INTO chitter (id, username, text) VALUES ('3', 'johndoe', 'This is the third peep');")

      peeps = Peep.all

      p peeps
      expect(peeps).to include("This is the first peep")
      expect(peeps).to include("This is the second peep")
      expect(peeps).to include("This is the third peep")
    end
  end
end