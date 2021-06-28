require_relative 'peep'
require_relative './database_connection'

class Chitter

  def self.add(peep:)
    time = Time.now
    result = DatabaseConnection.query("INSERT INTO chitters (peep, time) VALUES('#{peep}', '#{time.strftime("%k:%M %d/%m/%Y")}') RETURNING id, peep, time;")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.all
    chitter = DatabaseConnection.query("SELECT * FROM chitters")
      chitter.reverse_each.map do |peep|
        "#{peep['peep']} : #{peep['time']}"
      end
  end

  attr_reader :peep, :id, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

end
