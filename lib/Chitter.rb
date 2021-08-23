require 'pg'

class Chitter
  def self.feed
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test_spec')
    else
      connection = PG.connect(dbname: 'chitter_chat')
    end
    result = connection.exec('SELECT * FROM chitter_peeps;')
    result.map { |peep| peep['peep'] }
  end

  def self.create(peep:)
    if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test_spec')
    else
      connection = PG.connect(dbname: 'chitter_chat')
    end
    connection.exec("INSERT INTO chitter_peeps (peep) VALUES('#{peep}')")
  end
end