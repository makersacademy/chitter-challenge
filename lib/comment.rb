class Comment

  attr_reader :id, :comment, :peep, :maker

  def self.create(comment:, peep:, maker:)
    if ENV['RACK_ENV'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    result = con.exec(
      "INSERT INTO comments (comment, peep, maker) VALUES ($1, $2, $3) RETURNING id, comment, peep, maker;",
      [comment, peep, maker]
    )
    Comment.new(
      id: result[0]['id'],
      comment: result[0]['comment'],
      peep: result[0]['peep'],
      maker: result[0]['maker']
    )
  end

  def initialize(id:, comment:, peep:, maker:)
    @id = id
    @comment = comment
    @peep = peep
    @maker = maker
  end

end