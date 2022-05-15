require_relative 'database_connection'

class Peep
  attr_reader :id, :created_at, :body, :user_id

  def initialize(id:, created_at:, body:, user_id:)
    @id = id
    @created_at = DateTime.strptime(created_at, '%Y-%m-%d %H:%M:%S').strftime('%R')
    @body = body
    @user_id = user_id
  end

  def self.create(body:, user_id:)
    peep = DatabaseConnection.query(
      "INSERT INTO peeps (body, user_id) VALUES($1, $2) RETURNING id, created_at, body, user_id;", [body, user_id]
    )
    Peep.new(
      id: peep[0]['id'],
      created_at: peep[0]['created_at'],
      body: peep[0]['body'],
      user_id: peep[0]['user_id']
    )
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
        body: peep['body'],
        user_id: peep['user_id']
      )
    end
  end
end