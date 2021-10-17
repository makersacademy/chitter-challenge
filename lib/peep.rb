require 'pg'

class Peep

  attr_reader :content

  def initialize(content:)
    @content = content
  end 

  def self.create(content:)
    Peep.new(
      content: content)
  end
  
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] } #must take this out of the array? 
  end 
end 

