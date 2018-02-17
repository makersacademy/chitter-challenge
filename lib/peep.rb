require 'pg'

class Peep
  def self.all
    p ENV['RACK_ENV']
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      { text: peep['text'], author: peep['author'] }
    end
  end
end
