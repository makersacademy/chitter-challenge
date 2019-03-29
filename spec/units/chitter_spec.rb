require 'chitter'
describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_app_test')

      connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('masha', 'user_masha', CURRENT_TIMESTAMP, 'peep1');")
      connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('masha', 'user_masha', CURRENT_TIMESTAMP, 'peep2');")
      connection.exec("INSERT INTO chitter (name, handle, time, content) VALUES ('masha', 'user_masha', CURRENT_TIMESTAMP, 'peep3');")

      peeps = Chitter.all

      expect(peeps).to include("peep1")
      expect(peeps).to include("peep2")
      expect(peeps).to include("peep3")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Chitter.create(content: 'test peep')

      expect(Chitter.all).to include 'test peep'
    end
  end
end
