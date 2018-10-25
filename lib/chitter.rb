require 'pg'

class Chitter

  def self.all
    begin
      con = PG.connect :dbname => 'chitter'
      rs = con.exec "SELECT * FROM peeps"
      rs.map { |row| row['text'] }
    end
  end

end
