require 'pg'

class Chitter

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
      rs = con.exec "SELECT * FROM peeps"
      t = rs.map { |row| row['text'] }
      u = rs.map { |row| row['username'] }
      return "#{t.join} by #{u.join}"
  end

  def self.create_peep(text)
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
      rs = con.exec "INSERT INTO peeps (text) VALUES('#{text}')"
  end

end
