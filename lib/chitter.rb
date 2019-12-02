require 'pg'

class Chitter

  def self.all
    # ["Test Chitter Message", "Another test chitter", "yet another test chitter"]
connection = PG.connect(dbname: 'chitter_challenge')
result = connection.exec("SELECT * from chitters")
result.map { |chitter| chitter['peep']}
end
end
