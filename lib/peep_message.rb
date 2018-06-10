require 'pg'

class PeepMessage

  attr_reader :id, :message, :name, :username, :time

  def initialize(id, message, name, username, time)
    @id = id
    @message = message
    @name = name
    @username = username
    @time = time
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    connection = database_connection
    result = connection.exec("SELECT * FROM peeps")
    result.to_a.reverse.map do |peep|
      PeepMessage.new(peep['id'], peep['message'], peep['name'],
                      peep['username'], peep['time'])
    end
  end

  def self.create(message, name, username, time)
    connection = database_connection
    result = connection.exec("INSERT INTO peeps (message, name, username, time)
                              VALUES ('#{message}', '#{name}', '#{username}', '#{time}')
                              RETURNING id, message, name, username, time")
    id = result.first['id']
    peep_message = result.first['message']
    name = result.first['name']
    username = result.first['username']
    time = result.first['time']
    PeepMessage.new(id, peep_message, name, username, time)
  end

  private_class_method

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end
