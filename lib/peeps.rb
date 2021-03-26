require 'Time'
require_relative 'db_connection'
require 'pg'
class Peeps

  attr_accessor :text, :user_id, :date, :time, :id

  def initialize(text, user_id, date, time, id)
    @text = text
    @user_id = user_id
    @date = date
    @time = time
    @id = id
  end

  def self.post_peep(text, user = '1')
    t = Time.now
    date = t.strftime("%Y-%m-%d")
    time = t.strftime("%k:%M")
    post(text, user, date, time)
  end

  def self.post(text, user_id, date, time)
    #user_id = DBConnection.connection.exec("SELECT id FROM users WHERE username = '#{user}';")
    DBConnection.connection.exec("INSERT INTO peeps (text, date, time, user_id) VALUES ('#{text}', '#{date}', '#{time}', '#{user_id}');")
  end

  def self.all
    @peeps = []
    DBConnection.connection.exec("SELECT * FROM peeps").map do |peep|
      @peeps << Peeps.new(peep['text'], peep['user_ID'], peep['date'], peep['time'], peep['id'])
    end
    return @peeps
  end
end
