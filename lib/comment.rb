require 'pg'
require_relative 'database_connection'

class Comment

  attr_reader :id, :comment, :peep, :maker

  def self.create(comment:, peep:, maker:)
    result = DatabaseConnection.connection.exec_params(
      "INSERT INTO comments (comment, peep, maker) VALUES ($1, $2, $3) RETURNING id, comment, peep, maker;", [comment, peep, maker])
    Comment.new(id: result[0]['id'], comment: result[0]['comment'], peep: result[0]['peep'], maker: result[0]['maker'] )
  end

  def initialize(id:, comment:, peep:, maker:)
    @id = id
    @comment = comment
    @peep = peep
    @maker = maker
  end

end
