require 'pg'

class Peep
  attr_reader :message, :id

  def initialize(message:, id:)
    @message = message
    @id = id
  end

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM chitter_peeps;')
    result = result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end
  end

  def self.save(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params('INSERT INTO chitter_peeps (message) VALUES ($1) RETURNING message;', [message])
    p result
    Peep.new(id: result[0]['id'], message: result[0]['message'])
  end

  Peep.methods

end


 