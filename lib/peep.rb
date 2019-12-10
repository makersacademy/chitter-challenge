class Peep

  attr_reader :message, :id, :timestamp, :user_id

  def initialize(id:, message:, timestamp:, user_id:)
    @message = message.gsub("`apos*") {"'"}
    @id = id
    @user_id = user_id
    @timestamp = Time.parse(timestamp).strftime("%d/%m/%Y %H:%M")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |message|
      Peep.new(id: message['id'], message: message['message'], user_id: message['user_id'], timestamp: message['created_at'])
    end.reverse
  end

  def self.create(message:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, user_id) VALUES('#{message.gsub("'") {"`apos*"}}', '#{user_id}') RETURNING id, message, user_id, created_at;")

    Peep.new(id: result[0]['id'], user_id: result[0]['user_id'], message: result[0]['message'], timestamp: result[0]['created_at'])
  end
end
