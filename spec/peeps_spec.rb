require 'peep'

describe Peep do
  describe '.all' do
    it 'will display all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps(post) VALUES('This is my first peep!');")
      connection.exec("INSERT INTO peeps(post) VALUES('This is my second peep!');")
      connection.exec("INSERT INTO peeps(post) VALUES('This is my third peep!');")

      peeps = Peep.all
      expect(peeps).to include('This is my first peep!')
      expect(peeps).to include('This is my second peep!')
      expect(peeps).to include('This is my third peep!')
    end
  end
end
