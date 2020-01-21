require 'pg'
require_relative 'database_connection'

class Peeps
  attr_reader :id, :message, :time, :date

  def initialize(id:, message:, time: '', date: '')
    @id = id
    @message = message
    @time = time
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peeps.new(id: peep['id'], message: peep['message'], time: peep['time'], date: peep['date']) }

  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date, time;")
    Peeps.new(id: result[0]['id'], message: message, time: result[0]['time'], date: result[0]['date'])
  end
end
