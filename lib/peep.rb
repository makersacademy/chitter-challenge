require_relative './../app.rb'
require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'Chitter')

    result = connection.exec("SELECT * FROM peep_feed;")
    result.map { |peep| "#{peep['peeps']}"}
  end

  def self.create(body)
    connection = PG.connect(dbname: 'Chitter')

    connection.exec("INSERT INTO peep_feed (peeps) VALUES ('#{body}');")
  end
end