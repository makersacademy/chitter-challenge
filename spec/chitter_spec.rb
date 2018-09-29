require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all chits' do
      conn = PG.connect(dbname: 'chitter_test')

      conn.exec("INSERT INTO chits(message) VALUES ('hello everyone');")
      conn.exec("INSERT INTO chits(message) VALUES ('this is a first chit');")
      conn.exec("INSERT INTO chits(message) VALUES ('this is a second!!!');")

      chitter = Chitter.all

      expect(chitter).to include('hello everyone')
      expect(chitter).to include('this is a first chit')
      expect(chitter).to include('this is a second!!!')
    end
  end
end
