require 'pg'

class Peep
  def self.add(content:)
    prs_data = database_connect.exec_params("INSERT INTO peeps (content) VALUES ($1) RETURNING id, content;", [content])
    Peep.new(id: prs_data[0]['id'], content: prs_data[0]['content'])
  end
  
  def self.database_connect
    ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end
  
  attr_reader :id, :content
  
  def initialize(id:, content:)
    @id = id
    @content = content
  end
end
