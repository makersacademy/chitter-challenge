# require './lib/database_connection'

class Peep
  attr_reader :id, :peep, :time

  def initialize(id:, peep:, time:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.create(peep:)
    peep.gsub!(/\'/, "''")
    sql = "INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{Time.now}') RETURNING id, peep, time;"
    result = DatabaseConnection.query(sql)
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], time: peep['time'])
    end
  end
end
