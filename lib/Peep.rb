class Peep

  attr_reader :peep_id, :message, :date, :user_id, :reply_to

  def initialize(peep_id:, message:, date:, user_id:, reply_to: nil)
    @peep_id = peep_id
    @message = message
    @date = date
    @user_id = user_id
    @reply_to = reply_to
  end

  def self.create(message)
    date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    DatabaseConnection.query("INSERT INTO peeps (message, date, user_id, reply_to) VALUES ('#{message}', '#{date}', '#{user_id}', '#{reply_to}')")
  end

  def self.retrieve(peep_id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE peep_id = '#{peep_id}'")
    result.map do |user|
      Peep.new(
        peep_id: peep['peep_id'],
        message: peep['message'],
        date: peep['date'],
        user_id: peep['user_id'],
        reply_to: peep['reply_to']
      )
    end
  end
end
