require 'pg'

class Peep

  def self.all
      result = DatabaseConnection.query("SELECT name, handle, content, time FROM peeps ORDER BY time DESC;")
      result.map { |peep|
        peep
      }
  end

  def self.create(content:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect( dbname: 'peeps_test')
      else
        connection = PG.connect( dbname: 'peeps')
      end

    connection.exec("INSERT INTO peeps (content) VALUES ('#{content}')")
  end
end
