require_relative 'database_connection'

class Peep

  attr_reader :id, :username, :peep

  def initialize(id:, username:, peep:)
    @id  = id
    @username = username
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |a_peep|
      Peep.new(id: a_peep['id'], username: a_peep['username'], peep: a_peep['peep'])
    end
  end

  def self.create(peep:, username:)
    return false if(username).empty?
    result = DatabaseConnection.query("INSERT INTO peeps (peep, username) VALUES('#{peep}', '#{username}') RETURNING id, peep, username;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], peep: result[0]['peep'])
  end
end
