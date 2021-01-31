require 'pg'
require 'time'

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
      Peep.new(id: peep['id'], message: peep['message'], time: Time.parse(peep['time']))
     end
  end

  def self.create(message)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}')RETURNING id, message, time").first
    Peep.new(id: result['id'], message: result['message'], time: Time.parse(result['time']))
  end

end
