require_relative './../app.rb'
require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'Chitter')

    result = connection.exec("SELECT user_list.username,peeps,time 
      FROM peep_feed 
      INNER JOIN user_list 
      ON  peep_feed.user_id=user_list.user_id 
      ORDER BY time DESC;")
    result.map { |peep| "#{peep['peeps']} - Author: #{peep['username']} at #{peep['time']}"}
  end

  def self.create(body)
    connection = PG.connect(dbname: 'Chitter')

    connection.exec("INSERT INTO peep_feed (peeps, time) VALUES ('#{body}', DATE_TRUNC('second', CURRENT_TIMESTAMP::timestamp));")
  end
end