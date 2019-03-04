require 'pg'
require_relative 'database_connection'

class Peep

  
  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end

    raw_peeps = DatabaseConnection.query('SELECT * FROM peeps')

    peeps = raw_peeps.map do |item|
      { timestamp: item['timestamp'][0, 19], message: item['peep'] }
    end

    peeps.reverse
  end

  def self.post(new_peep)
    DatabaseConnection.query("INSERT INTO peeps VALUES (DEFAULT, DEFAULT, #{new_peep})")
  end
end
