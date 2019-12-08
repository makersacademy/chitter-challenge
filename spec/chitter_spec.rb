require 'chitter'

describe Chitter do
  describe '.all' do
    it 'return all posts' do
      connection = PG.connect(dbname: 'chitter_db_test')

      connection.exec("INSERT INTO chitter (message) VALUES ('1st post');")
      connection.exec("INSERT INTO chitter (message) VALUES('2nd post');")
      connection.exec("INSERT INTO chitter (message) VALUES('3rd post');")
      
      chitter = Chitter.all
      
      expect(chitter).to include "1st post"
      expect(chitter).to include "2nd post"
      expect(chitter).to include "3rd post"
    end
  end
end