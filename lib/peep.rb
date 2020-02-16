require 'pg'
class Peep
  attr_reader :text, :id, :time
  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else 
      conn = PG.connect( dbname: 'chitter' )
    end 
    result = conn.exec( "SELECT * FROM peeps" )
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['peep'], time: peep['time'])
    end
  end 


  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else 
      conn = PG.connect( dbname: 'chitter' )
    end 

    result = conn.exec("INSERT INTO peeps (peep) VALUES('#{text}') RETURNING id, peep, time")
    Peep.new(id: result[0]['id'], text: result[0]['peep'], time: result[0]['time'])
  end 

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect( dbname: 'chitter_test' )
    else 
      conn = PG.connect( dbname: 'chitter' )
    end 

    conn.exec("DELETE FROM peeps WHERE id = #{id}")
  
  end 



end 