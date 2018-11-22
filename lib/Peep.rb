class Peep

  attr_reader :peep_id, :message, :date, :user_id, :reply_to

  def initialize(peep_id:, message:, date:, user_id:, reply_to: nil)
    @peep_id = peep_id
    @message = message
    @date = date
    @user_id = user_id
    @reply_to = reply_to
  end

  def self.create(message:, user_id:, reply_to: nil)
    date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    # does not currently populate reply_to
    DatabaseConnection.query("INSERT INTO peeps (message, date, user_id) VALUES ('#{message}', '#{date}', '#{user_id}')")
  end

  def self.retrieve_single_peep(peep_id:)
    peep = DatabaseConnection.query("SELECT * FROM peeps WHERE peep_id = '#{peep_id}'").first
    Peep.new(
      peep_id: peep['peep_id'],
      message: peep['message'],
      date: peep['date'],
      user_id: peep['user_id'],
      reply_to: peep['reply_to']
    )
  end

  def self.retrieve_multiple_peeps(limit:)
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date DESC LIMIT #{limit}")
    peeps.map do |peep|
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
