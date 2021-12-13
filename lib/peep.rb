require 'pg'

class Peep
  attr_reader :created_at, :peep_body

  def initialize(created_at:, peep_body:)
       @created_at = created_at
       @peep_body = peep_body
  end 
  
  def self.all 
   connection = 
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'chitter_test')
      else
        PG.connect(dbname: 'chitter')
      end
   result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(created_at: peep['created_at'], peep_body: peep['message_body'])
    end 
  end 

  def self.create(peep_body:, created_at:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    result = connection.exec("INSERT INTO peeps (created_at, message_body) VALUES('#{created_at}', '#{peep_body}') RETURNING created_at, message_body")
    Peep.new(created_at: result[0]['created_at'], peep_body: result[0]['message_body'])

    
  end 

end