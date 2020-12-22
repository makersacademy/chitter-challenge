require 'pg'

class Peep
  def self.all
    con = PG.connect(dbname: 'chitter')
    query = con.exec "SELECT * FROM peeps"
    query.map do |row|
      "message: #{row['peep']} from: #{row['maker']}"
    end
  end
end
