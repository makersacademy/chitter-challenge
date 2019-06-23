require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitter (id, email, password, name, username, content) VALUES ('1', 'johndoe@gmail.com', 'password123', 'John Doe', 'johndoe', 'This is the first peep');")
      connection.exec("INSERT INTO chitter (id, email, password, name, username, content) VALUES ('2', 'johndoe@gmail.com', 'password123', 'John Doe', 'johndoe', 'This is the second peep');")
      connection.exec("INSERT INTO chitter (id, email, password, name, username, content) VALUES ('3', 'johndoe@gmail.com', 'password123', 'John Doe', 'johndoe', 'This is the third peep');")

      peeps = Peep.all

      p peeps
      expect(peeps).to include("This is the first peep")
      expect(peeps).to include("This is the second peep")
      expect(peeps).to include("This is the third peep")
    end
  end
end