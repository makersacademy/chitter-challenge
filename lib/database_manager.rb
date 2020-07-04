require 'pg'

class DatabaseManager

  def display
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test_db'
    else
      con = PG.connect :dbname => 'chitter_db'
    end

    results = con.exec "SELECT * FROM messages"

    arr = []

    results.map do |peep|
      arr << Peep.new(peep["message"], peep["name"])
    end

    arr

  end


  def add_peep(peep)
    @peep = peep
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test_db'
    else
      con = PG.connect :dbname => 'chitter_db'
    end
    con.exec "INSERT INTO messages(name, message, timestamp) VALUES('#{@peep.name}', '#{@peep.message}', '#{@peep.timestamp}');"
  end

end