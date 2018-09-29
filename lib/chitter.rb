require 'pg'

class Chitter

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    chits = conn.exec("SELECT * FROM chits ORDER BY updated_at DESC")
    p "******"
    chits.map { |chit| chit['name'] + " - " + chit['updated_at'] + " ----- chitter message: " + chit['message'] }
  end

end
