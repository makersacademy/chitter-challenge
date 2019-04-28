require 'pg'

class Peep
  attr_reader :id, :message, :user_id, :posted_time

  def initialize(id:, message:, user_id:, posted_time:)
    @id = id
    @message = message
    @user_id = user_id
    @posted_time = posted_time
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end

    result = connection.exec "SELECT * FROM peeps"
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], user_id: peep['user_id'], posted_time: peep['posted_time'])
    end
  end

  def self.add_peep(message, user_id)
    @message = message
    @user_id = user_id

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect :dbname => 'chitter_test'
    else
      connection = PG.connect :dbname => 'chitter'
    end
    result = connection.exec("INSERT INTO peeps (message, user_id) VALUES('#{@message}', '#{@user_id}') RETURNING id, message, user_id;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], user_id: result[0]['user_id'], posted_time: result[0]['posted_time'])
  end
end
