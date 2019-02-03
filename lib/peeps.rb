require_relative 'database_connection'

class Peep
  
  attr_reader :id, :peep, :date, :time, :username
  def initialize(id:, peep:, date:, time:, username:)
    @id = id
    @peep = peep
    @date = date
    @time = time
    @username = username
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map do |peep| 
      Peep.new(
        id: peep['id'],
        peep: peep['peep'],
        date: peep['date'],
        time: peep['time'],
        username: peep['username']
      )
    end
  end

  def self.add(peep:, username:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, date, time, username) VALUES('#{peep}', '#{DateTime.now.strftime("%d/%m/%Y")}', '#{DateTime.now.strftime("%I:%M%p")}', '#{username}') RETURNING id, peep, date, time, username;")
    Peep.new(id: result.first['id'], peep: result.first['peep'], date: result.first['date'], time: result.first['time'], username: result.first['username'])
  end
end
