require 'pg'

class Peep 

  attr_reader :message  

  def initialize(message:)
    @message = message
  end 

  # def self.all 
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'Chitter_test')
  #   else 
  #     connection = PG.connect(dbname: 'Chitter')
  #   end
  #   result = connection.exec("SELECT * FROM 'Chitter")
  #   result.map do
  #     |_peep| Peep.new(message: ['message'])
  #   end 
  # end 

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message")
    Peep.new(message: result[0]['message'])
  end


end
