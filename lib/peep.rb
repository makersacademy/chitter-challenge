require 'pg'

class Peep

  attr_reader :content, :created_at, :id

  def initialize(content:, id:, created_at:)
    @content = content
    @id = id
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        created_at: peep['created_at']
      )
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (content, created_at)
        VALUES('#{content}', CURRENT_TIME(0))
          RETURNING id, content, created_at;"
    )
    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      created_at: result[0]['created_at']
    )
  end

  def time
    created_at[0..4]
  end
end
