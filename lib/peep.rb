require 'pg'
require_relative './database_connection'

class Peeps

  def self.all
    # if ENV['RACK_ENV'] == 'test'
    #   connection = PG.connect(dbname: 'chitter_test')
    # else
    #   connection = PG.connect(dbname: 'chitter')
    # end
    peeps = DatabaseConnection.query('SELECT * FROM peeps ORDER BY create_time DESC;')
    peeps.map { |peep| peep['body'] }
  end
end