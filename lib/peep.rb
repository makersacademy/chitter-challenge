require_relative './database_connection'

class Peep
  attr_reader :id, :text

  def initialize(id:, peep:)
    @id = id
    @text = peep
  end

  def self.all
    result = DatabaseConnection.connection.exec "SELECT * FROM peeps ORDER BY created_at DESC;"
  
    result.map { |peep| Peep.new(id: peep['id'], peep: peep['post']) }
  end

  def self.create(peep:)
    result = DatabaseConnection.connection.exec_params "INSERT INTO peeps (post) VALUES ($1)" \
      "RETURNING id, post;", [peep]

    Peep.new(id: result[0]['id'], peep: result[0]['post'])
  end
end
