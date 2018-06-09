require 'pg'

class PeepMessage

  attr_reader :id, :message, :name, :username

  def initialize(id, message, name, username)
    @id = id
    @message = message
    @name = name
    @username = username
  end

  def ==(other)
    @id == other.id
  end

  def self.all
    connection = database_connection
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      PeepMessage.new(peep['id'], peep['message'],
                      peep['name'], peep['username'])
    end
  end

  def self.create(message, name, username)
    connection = database_connection
    result = connection.exec("INSERT INTO peeps (message, name, username)
                              VALUES ('#{message}', '#{name}', '#{username}')
                              RETURNING id, message, name, username")
    id = result.first['id']
    peep_message = result.first['message']
    name = result.first['name']
    username = result.first['username']
    PeepMessage.new(id, peep_message, name, username)
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
