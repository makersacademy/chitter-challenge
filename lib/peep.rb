require 'date'
require_relative 'postgresql_manager'
require_relative 'user'
require 'mail'

class Peep
  def self.create(body:, user_id:)
    q =   "INSERT INTO Peeps(body, user_id)"\
          " VALUES"\
          " ($$#{body}$$, #{user_id})"\
          " RETURNING"\
          " id, body, created_at, user_id;"
    result = PostgresqlManager.query(q)
    initialize(result[0])
  end

  def self.find(id)
    q = "SELECT * FROM Peeps WHERE id=#{id};"
    result = PostgresqlManager.query(q)
    initialize(result[0])
  end

  def self.all
    q = "SELECT * FROM Peeps ORDER BY created_at DESC;"
    result = PostgresqlManager.query(q)
    result.map { |rs| initialize(rs) }
  end

  def self.initialize(rs)
    Peep.new(id: rs['id'], body: rs['body'], created_at: rs['created_at'], user_id: rs['user_id'])
  end

  attr_reader :id, :body, :created_at, :user

  def initialize(id:, body:, created_at:, user_id:)
    @id = id
    @body = body
    @created_at = DateTime.parse(created_at)
    @user = User.find(id: user_id)
  end

end
