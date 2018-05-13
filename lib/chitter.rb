require 'pg'

class Chitter

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_manager_test'
    else
      con = PG.connect :dbname => 'chitter_manager'
    end
    rs = con.exec 'SELECT * FROM chitter';
    rs.map { |row| row['peep'] }
  end

  def self.add(peep)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_manager_test'
    else
      con = PG.connect :dbname => 'chitter_manager'
    end
    con.exec "INSERT INTO chitter (peep)
    VALUES('#{peep}')";
  end
end
