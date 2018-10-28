require 'postgresql_manager'
require 'date'

class Peep

  def self.create(body:)
    q =   "INSERT INTO Peeps(body)"\
          " VALUES"\
          " ($$#{body}$$)"\
          " RETURNING"\
          " id, body, created_at;"
    result = PostgresqlManager.query(q)
    initialize(result[0])
  end

  def self.find(id)
    q = "SELECT * FROM PEEPS WHERE id=#{id};"
    result = PostgresqlManager.query(q)
    initialize(result[0])
  end

  def self.initialize(rs)
    Peep.new(id: rs['id'], body: rs['body'], created_at: rs['created_at'])
  end


  attr_reader :id, :body, :created_at

  def initialize(id:, body:, created_at:)
    @id = id
    @body = body
    @created_at = DateTime.parse(created_at)
  end

end
