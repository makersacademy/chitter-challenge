require 'pg'

class Chitter

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_messenger_test')
    else
      connection = PG.connect(dbname: 'chitter_messenger')
    end

    result = connection.exec('SELECT * FROM messages;')
    result.map do |message|
      Chitter.new(id: message['id'], peep: message['peep'])
    end
  end

  def self.create(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_messenger_test')
    else
      connection = PG.connect(dbname: 'chitter_messenger')
    end

    result = connection.exec_params(
      'INSERT INTO messages (peep) VALUES($1) RETURNING id, peep;', [peep]
      )
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'])
  end
  
end
