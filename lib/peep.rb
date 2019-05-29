require './lib/database_connection'

class Peep

  attr_reader :id, :peep, :timestamp
  
  def initialize(id:, peep:, timestamp:)
    @id = id
    @peep = peep
    @timestamp = timestamp
  end

  def self.create(peep:)
    time = Time.now.strftime("%Y-%m-%d %H:%M")
    formatted_peep = peep.gsub(/'/, "''")

    sql = "INSERT INTO peeps (peep, timestamp) VALUES('#{formatted_peep}', '#{time}') RETURNING id, peep, timestamp;"
    result = DatabaseConnection.query(sql)
    Peep.new(
      id: result[0]["id"],
      peep: result[0]["peep"],
      timestamp: result[0]['timestamp']
    )
  end

  def self.all
    sql = "SELECT * FROM peeps ORDER BY id DESC;"
    result = DatabaseConnection.query(sql)
    result.map do |peep|
      Peep.new(id: peep["id"],
        peep: peep["peep"],
        timestamp: peep['timestamp']
      )
    end
  end
end