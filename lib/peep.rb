require 'pg'

class Peep
  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    query = con.exec "SELECT * FROM peeps"
    query.map do |row|
      "message: #{row['peep']} from: #{row['maker']}"
    end
  end
end
