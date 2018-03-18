require 'pg'
require 'database_connection'

class Peep
  def self.connection
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'chitter_test')
    else
      return PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    result = connection.query("SELECT * FROM peeps")
    result.map { |peep| peep['peep'] }
  end

  def self.create(options)
    connection.query("INSERT INTO peeps (peep) VALUES('#{options[:peep]}')")
  end
end
