require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('I am at Makers today');")
      connection.exec("INSERT INTO peeps (message) VALUES ('It is a sunny day');")

      peeps = Peeps.all

      expect(peeps).to include('I am at Makers today')
      expect(peeps).to include ('It is a sunny day')
    end
  end
end
