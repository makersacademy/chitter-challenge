require 'pg'

class Peep

  attr_reader :content, :created_on

  def initialize(content:, created_on:)
    @content = content
    @created_on = created_on
  end 

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("INSERT INTO peeps (content) VALUES('#{content}') 
    RETURNING id, content, created_on;").first
    Peep.new(content: result['content'], created_on:result['created_on'] )
  end
  
  
  def self.all
    result = []
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end 
    sqldata = connection.exec("SELECT * FROM peeps;")
    sqldata.map { |row | result << Peep.new(content: row['content'], created_on: row['created_on']) } #taking out the content, but not storing it, after the map, array of strings.  
    result #array of Peeps 
  end 
end 

