require_relative './database_connection'

class Peep
  attr_reader :id, :text, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @text = peep
    @created_at = format_time(created_at)
  end

  def self.all
    result = DatabaseConnection.query sql: "SELECT * FROM peeps ORDER BY created_at DESC;"
      
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        peep: peep['post'],
        created_at: peep['created_at']
      )
    end
  end

  def self.create(peep:)
    result = DatabaseConnection.query sql: "INSERT INTO peeps (post) VALUES ($1)" \
      "RETURNING id, post, created_at;", params: [peep]

    Peep.new(
      id: result[0]['id'],
      peep: result[0]['post'],
      created_at: result[0]['created_at']
    )
  end

  private

  def format_time(created_at)
    Time.parse(created_at).strftime('%l:%M%P, %-d %b %Y')
  end
end
