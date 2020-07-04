require 'pg'

class DatabaseManager
  def display_peeps
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test_db'
    else
      con = PG.connect :dbname => 'chitter_db'
    end

      rs = con.exec "SELECT * FROM chitter"
      array = []
      rs.each do |row|
        array << row["message"]
      end
    array
  end

  def add_peep(peep)
    @peep = peep
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test_db'
    else
      con = PG.connect :dbname => 'chitter_db'
    end
    con.exec "INSERT INTO messages(name, message) VALUES('#{@peep.user}', '#{@peep.message}');"
  end
end