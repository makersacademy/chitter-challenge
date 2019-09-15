require_relative 'database_connection'

class Peeps

  attr_reader :id, :text, :time_posted, :username

  def initialize(id:, text:, time_posted:, username:)
    @id = id
    @text = text
    @time_posted = time_posted
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.reverse_each.map do |peep|
    Peeps.new(id: peep['id'], text: peep['text'], time_posted: peep['time_posted'], username: peep['username'])
    end
  end

  def self.post(text, time, username)
    result = DatabaseConnection.query("INSERT INTO peeps (text, time_posted, username) VALUES ('#{text}', '#{time}', '#{username}') RETURNING id, text, time_posted, username")
    Peeps.new(id: result[0]['id'], text: result[0]['text'], time_posted: result[0]['time_posted'], username: result[0]['username'])
  end

end