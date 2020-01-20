require 'pg'

class Messages

  attr_reader :id, :message

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end


  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    message = connection.exec("INSERT INTO messages (message) VALUES ('#{message}') RETURNING id, message;")
    Messages.new(id: message[0]['id'], message: message[0]['message'])  
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    messages = connection.exec('SELECT * FROM messages;')
    # result.map do |message|
    #   Messages.new(id: message['id'], message: message['message'])
    # end
    messages.map do |message| 
      Messages.new(
        id: message['id'], 
        message: message['message']
      )
    end


  def self.all_rev
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    messages = connection.exec('SELECT * FROM messages ORDER BY id DESC;')
    # result.map do |message|
    #   Messages.new(id: message['id'], message: message['message'])
    # end
    messages.map do |message| 
      Messages.new(
        id: message['id'], 
        message: message['message']
      )
    end
  end

  def self.delete(id:)

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    connection.exec("DELETE FROM message WHERE id = #{id:}")
  end

end