require 'PG'

class Peep

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end 

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_Test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end 
    
    peeps = connection.exec('SELECT * FROM peeps')
    peeps.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end

    def self.create(message:)
      
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'Chitter_Test')
      else
        connection = PG.connect(dbname: 'Chitter')
      end 
      
      result = connection.exec_params(
  "INSERT INTO peeps (message) VALUES ($1) RETURNING message", [:message])
      Peep.new(id: result[0]['id'], message: result[0]['message'])
    end 
  end 
end
