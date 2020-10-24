require_relative'./database_connection'

class Peep

  attr_reader :id, :peep, :peeptime, :name

  def initialize(id:, peep:, peeptime:, name:)
    @id = id
    @peep = peep
    @peeptime = peeptime
    @name = name
  end

  def self.all
    # result = @connection.exec("SELECT * FROM peeps ORDER BY peeptime DESC;")
    # result.map do |peep|
    #   Peep.new(id: peep['id'], peep: peep['peep'], peeptime: peep['peeptime'])
    # end
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY peeptime DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], peeptime: peep['peeptime'], name: peep['name'])
    end
  end

  def self.create(peep:, name:)
    peep = peep.gsub("'", "''")
    result = DatabaseConnection.query("INSERT INTO peeps (peep, name) VALUES ('#{peep}', '#{name}') RETURNING id, peep, peeptime, name;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], peeptime: result[0]['peeptime'], name: result[0]['name'])
  end

end
