require 'pg'
# require 'user'
require_relative 'databaseconnection'

class Peep

  def self.all
      peeps = DatabaseConnection.query("SELECT name, username, content, time, date FROM peeps ORDER BY date, time DESC;")
      peeps.map { |peep|
        peep
      }
  end

  def self.create(content:, name:, username:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect( dbname: 'peeps_test')
      else
        connection = PG.connect( dbname: 'peeps')
      end




    connection.exec("INSERT INTO peeps (name, content, username) VALUES ('#{name}','#{content}', '#{username}')")
  end
end
