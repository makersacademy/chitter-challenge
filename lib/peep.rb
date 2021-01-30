require 'pg'

class Peep

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
     end
  end

  def self.create(message)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}')")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time: peep['time'])
     end
  end
end
