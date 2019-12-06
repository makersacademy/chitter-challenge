require 'pg'

class Message

  attr_reader :id, :message, :Time

  def initialize(id, message, time)
    @id = id
    @message = message
    @time = time
  end

  def self.add(message)
    database_selector

    @connection.exec("INSERT INTO messages(message, time) VALUES('#{message}', '#{Time.now}')")
  end

  def self.all
    database_selector

    result = @connection.exec("SELECT * FROM messages ORDER BY time DESC")
    
    result.map { |peep|
      Message.new(peep['id'], peep['message'], peep['time'])
    }
  end

  private

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'message_database_test')
    else
      @connection = PG.connect(dbname: 'message_database')
    end
  end

end