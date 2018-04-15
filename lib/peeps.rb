require 'pg'

class Peeps
  def self.all
    con = PG.connect(dbname: 'chitter')
    posts = con.exec("SELECT * FROM peeps;")
    posts.map { |row| row["peep"] }
  end
end
