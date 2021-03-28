require 'Time'
require_relative 'db_connection'
require 'pg'
require_relative 'user'
class Peeps

  attr_accessor :text, :user_id, :date, :time, :id, :name

  def initialize(text, user_id, date, time, id, name)
    @text = text
    @user_id = user_id
    @date = date
    @time = time
    @id = id
    @name = name
  end

  def self.post_peep(text, user_id)
    t = Time.now
    date = t.strftime("%Y-%m-%d")
    time = t.strftime("%k:%M")
    text = text.delete(?')
    post(text, user_id, date, time)
  end

  def self.post(text, user_id, date, time)
    DBConnection.connection.exec("INSERT INTO peeps (text, date, time, user_id) VALUES ('#{text}', '#{date}', '#{time}', '#{user_id}');")
  end

  def self.all
    @peeps = []
    DBConnection.connection.exec("SELECT peeps.text, peeps.user_id, peeps.date, peeps.time, peeps.id, users.name FROM peeps LEFT JOIN users ON peeps.user_id = users.id ORDER BY date DESC, time DESC").map do |peep|
      @peeps << Peeps.new(peep['text'], peep['user_ID'], peep['date'], peep['time'], peep['id'], peep['name'])
    end
    return @peeps
  end
end

#
