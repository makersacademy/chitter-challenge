require 'pg'
require_relative 'database_connection'
require_relative 'database_connection_setup'

class Peep

  attr_reader :id, :peep, :created_at

  def initialize(id: id, peep: peep, created_at: created_at)
    @id  = id
    @peep = peep
    @created_at = created_at
  end

  def self.all
      result = DatabaseConnection.query("SELECT * FROM peeps")
      result.map do |peep|
        Peep.new(
          created_at: peep['created_at'],
          peep: peep['peep'],
          id: peep['id']
        )
      end
    end


  def self.create(id: id, peep: peep , created_at: created_at)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', LOCALTIMESTAMP) RETURNING id, peep, created_at;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

end
