require 'pg'

class Peep

  attr_reader :content

  def initialize(content:)
    @content = content
  end 

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("INSERT INTO peeps (content) VALUES('#{content}') 
    RETURNING id, content;").first
    Peep.new(content: result['content'])
  end
  
  
  def self.all
    result = []
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end 
    sqldata = connection.exec("SELECT * FROM peeps;")
    sqldata.map { |row | result << Peep.new(content: row['content']) } #taking out the content, but not storing it, after the map, array of strings.  
    result #array of Peeps 
  end 
end 

