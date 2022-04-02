require_relative './database_connection'

class Peep
  attr_reader :id, :text

  def initialize(id:, peep:)
    @id = id
    @text = peep
  end

  def self.all
    result = DatabaseConnection.query sql: "SELECT * FROM peeps ORDER BY created_at DESC;"
  
    result.map { |peep| Peep.new(id: peep['id'], peep: peep['post']) }
  end

  def self.create(peep:)
    result = DatabaseConnection.query sql: "INSERT INTO peeps (post) VALUES ($1)" \
      "RETURNING id, post;", params: [peep]

    Peep.new(id: result[0]['id'], peep: result[0]['post'])
  end
end
