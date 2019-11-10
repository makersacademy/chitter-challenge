class Message

  attr_reader :id, :sender, :message, :date, :time

  def initialize(id:, sender:, message:, time_sent:)
    @id = id
    @sender = sender
    @message = message
    date_time_seperator(time_sent)
  end

  def self.new_message(sender:,content:)
    row_hash = database.exec("INSERT INTO chits(message,date_time,sender)
    VALUES ('#{content}','#{Time.now}','#{sender}') RETURNING id, message, date_time, sender").first
    Message.new(id:row_hash['id'], sender:row_hash['sender'], message:row_hash['message'], time_sent:row_hash['date_time'])
  end

  def self.all
    database.exec("SELECT * FROM chits").map do |row|
      Message.new(id:row['id'], sender:row['sender'], message:row['message'], time_sent:row['date_time'])
    end
  end

  def self.sort(array_of_messages)
    array_of_messages.reverse
  end

  private

  def self.database
    ENV['RACK_ENV'] == 'test' ? PG.connect(dbname:'chitter_test') : PG.connect(dbname:'chitter')
  end

  def date_time_seperator(time)
    @date = time.to_s[0..9].split("-").join('/')
    @time = time.to_s[11..15]
  end


end
