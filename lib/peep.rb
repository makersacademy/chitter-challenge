require 'pg'

class Peep
  def self.all(connection = connect_to_database)
    result = connection.exec 'SELECT * FROM peeps'
    result.map { |row| row['text'] }
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect dbname: 'chitter_test'
    else
      PG.connect dbname: 'chitter'
    end
  end
end
