require 'pg'

class Peep

  attr_reader :content, :created_at, :id

  def initialize(content:, id:, created_at:)
    @content = content
    @id = id
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |p|
      Peep.new(id: p['id'], content: p['content'], created_at: p['created_at'])
    end
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    table = "peeps (content, created_at)"
    values = "'#{content}', CURRENT_TIME(0)"
    return_values = "id, content, created_at"
    query = "INSERT INTO #{table} VALUES(#{values}) RETURNING #{return_values};"
    result = connection.exec(query)
    Peep.new(id: result[0]['id'], content: result[0]['content'], created_at: result[0]['created_at'])
  end

  def time
    created_at[0..4]
  end
end
