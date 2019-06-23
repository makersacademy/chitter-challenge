require 'pg'

class Peep
  attr_reader :content, :id

  def initialize(id:, content:)
    @content = content
    @id = id
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (content) VALUES ('#{content}') RETURNING id, content;")    
    Peep.new(id: result[0]['id'], content: result[0]['content'])
  end

  def self.order_by_date
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY CREATED_AT DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'])           
    end
    
  end
end
