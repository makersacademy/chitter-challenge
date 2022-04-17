require 'pg'

class Chitter

  attr_reader :id, :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitters;")
    result.map do |chitter|
    Chitter.new(
      id: chitter['id'],
      peep: chitter['peep'],
      created_at: chitter['created_at']
    )
    end
  end
  
  def self.create(peep)
    result = DatabaseConnection.query("INSERT INTO chitters (peep) VALUES($1);", [peep])
    # Chitter.new(id: result['id'], peep: result['peep'], created_at: result['created_at'])
end
end