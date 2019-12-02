require 'pg'

class Chitter

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_challenge_test')
        else
          connection = PG.connect(dbname: 'chitter_challenge')
        end
    # ["Test Chitter Message", "Another test chitter", "yet another test chitter"]

result = connection.exec("SELECT * FROM chitters ORDER BY id DESC")

result.map { |chitter|
  chitter['peep'] }

end

def self.create(peep:)

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_challenge_test')
  else
    connection = PG.connect(dbname: 'chitter_challenge')
end

connection.exec("INSERT INTO chitters (peep) VALUES ('#{peep}')")
end
end
