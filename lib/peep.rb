require 'pg'

class Peep
  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] }
  end

  def self.create(content:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec_params(
      "INSERT INTO peeps (content) VALUES($1) RETURNING id, content;", [content]
      )
    Peep.new(id: result[0]['id'], content: result[0]['content'])
  end
end
