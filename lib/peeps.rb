require 'pg'
require_relative 'database_connection'

class Peeps
  attr_reader :id, :message, :time, :date, :user_id

  def initialize(id:, message:, time: '', date: '', user_id:)
    @id = id
    @message = message
    @time = time
    @date = date
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peeps.new(id: peep['id'], message: peep['message'], time: peep['time'], date: peep['date'], user_id: peep['user_id']) }

  end

  def self.create(message:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date, time;")
    Peeps.new(id: result[0]['id'], message: message, time: result[0]['time'], date: result[0]['date'], user_id: user_id)
  end
end
