require 'pg'

class Peep

  attr_reader :id, :content, :created_at

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at
  end 

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec "SELECT * FROM peeps" 
    result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], created_at: peep['created_at'])
    end
  end

  def self.create(new_content:) 
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end 
    result = connection.exec_params(
"INSERT INTO peeps (content) VALUES ($1) RETURNING id, content, created_at;", [new_content])
    Peep.new(id: result[0]['id'], content: result[0]['content'], 
created_at: result[0]['created_at'])
  end

 
end
