require 'pg'

class Chitter

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
      rs = con.exec "SELECT * FROM peeps"
      rs.map { |row| row['text'] }
  end

end
