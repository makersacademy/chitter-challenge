require 'pg'
require 'time'
require_relative 'database_connection'

class Peep

  attr_reader :user_id, :body, :timestamp

  def initialize(user_id, body, timestamp)
      @user_id = user_id
      @body = body
      @timestamp = timestamp
  end
  
  def self.timeline
    result = DatabaseConnection.query('SELECT user_id, body, timestamp FROM peeps;')
    result.map do |peep|
      Peep.new(peep['user_id'], peep['body'], Peep.reformat(peep['timestamp']))
    end
  end

  def self.add_post(user_id, body)
    result = DatabaseConnection.query("INSERT INTO peeps (user_id, body) 
                               VALUES ('#{user_id}', '#{body}')
                                RETURNING user_id, body, timestamp;")
    Peep.new(result[0]['user_id'], result[0]['body'], result[0]['timestamp'])
  end

  def self.reformat(timestamp)
    # The below line reformats the date to dd/mm/yyyy. But ruby doesnt want to cooperate >:0
    # english_datetime = timestamp.strftime("%d/%m/%Y")
    new_timestamp = timestamp.to_s.slice(0..15)
  end
end