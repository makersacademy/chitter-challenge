require 'pg'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: 'chitter_test'
    else
      connection = PG.connect dbname: 'chitter'
    end
    p "connection is #{connection}"
    peeps = connection.exec "SELECT * FROM peeps"
    p "peeps is #{peeps}"
    p peeps.map { |peep| peep["body"] }
  end

  def self.create(peep)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect dbname: 'chitter_test'
    else
      connection = PG.connect dbname: 'chitter'
    end
    connection.exec "INSERT INTO peeps(body) VALUES ('#{peep}')"

  end

end
