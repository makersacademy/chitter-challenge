require 'pg'

class Peep
  attr_reader :content, :id, :date

  def initialize(id:, content:, date:)
    @content = content
    @id = id
    @date = date
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (content) VALUES ('#{content}') RETURNING id, content, created_at;")    
    Peep.new(id: result[0]['id'], content: result[0]['content'], date: result[0]['created_at'])
  end

  def self.order_by_date
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY CREATED_AT DESC")
    result.map do |peep|
      Peep.new(id: peep['id'], 
        content: peep['content'], 
        date: peep['created_at'])           
    end    
  end
  
end
