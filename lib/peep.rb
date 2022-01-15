require 'PG'
require 'date'

class Peep

  attr_reader :id, :created_at, :message

  TIME_FORMAT = '%H:%M'.freeze

  def initialize(id:, created_at:, message:)
    @id = id
    @created_at = created_at
    @message = message
  end

  def Peep.all
    connection = db_connect
    peeps = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    peeps.map do |peep| 
      Peep.new(id: peep['id'], 
        created_at: post_time_format(peep['created_at']),
        message: peep['message'])
    end
  end

  def Peep.create_peep(message:)
    connection = db_connect
    result = connection.exec_params(
      'INSERT INTO peeps (message) VALUES ($1) RETURNING id, created_at, message', [message])
    Peep.new(
      id: result[0]['id'], 
      created_at: result[0]['created_at'], 
      message: result[0]['message'])
  end

  # make private class methods 

  def Peep.db_connect
    if 'test' == ENV['ENVIRONMENT']
      connection = PG.connect(dbname: 'chitterbase_test')
    else 
      connection = PG.connect(dbname: 'chitterbase')
    end
  end

  def Peep.post_time_format(post_time)
    DateTime.parse(post_time).strftime(TIME_FORMAT)
  end

end
