require 'pg'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end

    result = connection.exec "SELECT * FROM peeps"
    result.field_values('message')
  end
end
