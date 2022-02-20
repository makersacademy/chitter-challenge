require 'database_connection'

class Peeps

  attr_reader :id, :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = DateTime.parse(created_at).strftime("%d/%m/%Y %H:%M")
  end

  def self.all
    all_peeps = DatabaseConnection.query( "SELECT * FROM peeps ORDER BY id DESC;")
    all_peeps.map { |post| Peeps.new(id: post['id'], peep: post['peep'], created_at: post['created_at']) }
  end

  def self.create(peep:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps(peep) VALUES($1) RETURNING id, peep, created_at;",[peep]
    )
    Peeps.new(id: result[0]['id',], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end
end