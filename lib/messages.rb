require 'pg'

class Messages

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
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
    
  end

end