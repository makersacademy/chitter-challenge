require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all chits' do
      conn = PG.connect(dbname: 'chitter_test')

      conn.exec("INSERT INTO chits(name, message, updated_at) VALUES ('bob', 'hello everyone', '2018-09-29 14:10:22.538287');")
      conn.exec("INSERT INTO chits(name, message, updated_at) VALUES ('tom', 'this is a first chit', '2018-09-29 14:10:22.538287');")
      conn.exec("INSERT INTO chits(name, message, updated_at) VALUES ('fred', 'this is a second!!!', '2018-09-29 14:10:22.538287');")

      chitter = Chitter.all

      expect(chitter).to include("bob - 2018-09-29 14:10:22.538287 ----- chitter message: hello everyone")
      expect(chitter).to include("tom - 2018-09-29 14:10:22.538287 ----- chitter message: this is a first chit")
      expect(chitter).to include("fred - 2018-09-29 14:10:22.538287 ----- chitter message: this is a second!!!")
    end
  end
end
