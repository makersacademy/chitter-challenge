require_relative 'database_connection'

class User

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      User.new(
        id: peep['id'],
        peep: peep['peep']
      )
    end
  end

  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep;")
    User.new(id: result[0]['id'], peep: result[0]['peep'])
  end

end
