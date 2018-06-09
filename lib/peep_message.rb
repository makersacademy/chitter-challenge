require 'pg'

class PeepMessage

  attr_reader :id, :message, :name, :username

  def initialize(id, message, name, username)
    @id  = id
    @message = message
    @name = name
    @username = username
  end

  def self.create(message, name, username)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("INSERT INTO peeps (message, name, username)
                              VALUES ('#{message}', '#{name}', '#{username}')
                              RETURNING id, message, name, username")
    id = result.first['id']
    peep_message = result.first['message']
    name = result.first['name']
    username = result.first['username']
    PeepMessage.new(id, peep_message, name, username)
  end

end
