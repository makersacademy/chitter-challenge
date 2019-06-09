require './db/database'
require 'date'

class Peep 
  attr_reader :body, :timestamp, :id, :user
  
  def initialize(body, id, timestamp, user = "Anonymous")
    @body = body
    @id = id
    @timestamp = convert_date(timestamp)
    @user = user
  end

  def self.all 
    Database.setup
    result = Database.query("SELECT * FROM peeps ORDER BY time_created DESC")
    p result

    result.map do |peep|
      Peep.new(peep['peep_body'], peep['id'], peep['time_created'], peep['user_id'])
    end
  end

  def to_s
    "#{@body}: #{@timestamp}"
  end

  def self.add(peep)
    Database.setup
    result = Database.query("INSERT INTO peeps (peep_body) VALUES ('#{peep}')")
  end

  private
  def convert_date(timestamp)
    DateTime.parse(timestamp).strftime('%d-%m-%Y at %I:%M %p')
  end
end