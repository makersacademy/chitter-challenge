require_relative 'database_connection'

class Peep
  attr_reader :id, :created_at, :body

  def initialize(id:, created_at:, body:)
    @id = id
    @created_at = DateTime.strptime(created_at, '%Y-%m-%d %H:%M:%S').strftime('%R')
    @body = body
  end

  def self.create(body:)
    peep = DatabaseConnection.query(
      "INSERT INTO peeps (body) VALUES($1) RETURNING id, created_at, body;", [body]
    )
    Peep.new(id: peep[0]['id'], created_at: peep[0]['created_at'], body: peep[0]['body'])
  end

  def self.all
    peeps = DatabaseConnection.query(
      "SELECT * FROM peeps;"
    )
    
    peeps = peeps.sort_by { |peep| peep['created_at'] }.reverse!

    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        created_at: peep['created_at'],
        body: peep['body']
      )
    end
  end
end