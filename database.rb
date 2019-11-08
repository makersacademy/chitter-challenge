require 'pg'

class Database
  def self.connection
    return PG.connect(dbname: ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter')
  end
end
