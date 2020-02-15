require 'pg'
class Peep
  attr_reader :text, :id
  def initialize(id:, text:)
    @id = id
    @text = text
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else 
      conn = PG.connect( dbname: 'chitter' )
    end 
    result = conn.exec( "SELECT * FROM peeps" )
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['peep'])
    end
  end 


  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else 
      conn = PG.connect( dbname: 'chitter' )
    end 

    result = conn.exec("INSERT INTO peeps (peep) VALUES('#{text}') RETURNING id, peep")
    Peep.new(id: result[0]['id'], text: result[0]['peep'])
  end 

end 