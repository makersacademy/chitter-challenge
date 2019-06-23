require 'pg'
class Peep

  attr_reader :user_id, :body, :timestamp

  def initialize(user_id, body, timestamp)
      @user_id = user_id
      @body = body
      @timestamp = timestamp
  end
  
  def self.timeline
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname:'chitter_db')
    end

    result = connection.exec('SELECT user_id, body, timestamp FROM peeps;')
    result.map do |peep|
      Peep.new(peep['user_id'], peep['body'], peep['timestamp'])
    end
  end

end