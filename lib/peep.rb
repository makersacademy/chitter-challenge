require 'pg'

class Peep
  def self.all
    database = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    conn = PG.connect(dbname: database)
    result = conn.exec("SELECT * FROM peeps;")
    result.map { |row| row['text']}
  end
end
