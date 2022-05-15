require 'pg'

class Chitter

  attr_reader :id, :peep, :posted_at

  def initialize(id:, peep:, posted_at:)
    @id = id
    @peep = peep
    @posted_at = posted_at
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_messenger_test')
    else
      connection = PG.connect(dbname: 'chitter_messenger')
    end

    result = connection.exec('SELECT * FROM messages;')
    result.map do |message|
      Chitter.new(id: message['id'], peep: message['peep'], posted_at: message['posted_at'])
    end
  end

  def self.create(peep:, posted_at:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_messenger_test')
    else
      connection = PG.connect(dbname: 'chitter_messenger')
    end

    result = connection.exec_params(
      'INSERT INTO messages (peep, posted_at) VALUES($1, $2) RETURNING id, peep, posted_at;', [peep, posted_at]
      )
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], posted_at: result[0]['posted_at'])
  end
  
end
