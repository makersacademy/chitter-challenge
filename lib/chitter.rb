require 'pg'

class Chitter

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    chits = conn.exec("SELECT * FROM chits")
    chits.map { |chit| chit['message'] }
    # print a
    # b = chits.map { |chit| chit['updated_at'] }
    # print b
    # a + b
  end

end
