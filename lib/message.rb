class Message




  attr_reader :id, :sender, :message, :time_sent

  def initialize(id:, sender:, message:, time_sent:)
    @id = id
    @sender = sender
    @message = message
    @time_sent = time_sent
  end

  def self.new_message(sender:,content:)
    row_hash = database.exec("INSERT INTO chits(message,date_time,sender)
    VALUES ('#{content})','#{Time.now}','#{sender}') RETURNING id,message,date_time,sender").first
    Message.new(id:row_hash['id'], sender:row_hash['sender'], message:row_hash['message'], time_sent:row_hash['date_time'])
  end
  private

  def self.database
    ENV['RACK_ENV'] == 'test' ? PG.connect(dbname:'chitter_test') : PG.connect(dbname:'chitter')
  end

end
