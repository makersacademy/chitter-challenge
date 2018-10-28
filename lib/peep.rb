require './lib/database_connection'

class Peep
  attr_reader :id, :message, :created_at, :peep_time, :user_id, :username

  def initialize(id:, message:, created_at:, peep_time:, user_id:, username:)
    @id = id
    @message = message
    @created_at = created_at
    @peep_time = peep_time
    @user_id = user_id
    @username = username
  end

  def self.new_peep(message:, user_id:)

    DatabaseConnection.query("INSERT INTO peeps
      (message, user_id) VALUES('#{message}', '#{user_id}')")

    result = DatabaseConnection.query("SELECT peeps.*, users.username FROM peeps LEFT JOIN users ON peeps.user_id = users.id")

    Peep.new(id: result[0]['id'],
      message: result[0]['message'],
      created_at: result[0]['created_at'],
      peep_time: peep_time(result[0]['created_at']), user_id: result[0]['user_id'],
      username: result[0]['username']
      )
  end

  def self.view_all_peeps
    result = DatabaseConnection.query("SELECT peeps.*, users.username FROM peeps LEFT JOIN users ON peeps.user_id = users.id ORDER BY created_at DESC;")

    result.map do |peep|
      Peep.new(id: peep['id'],
        message: peep['message'],
        created_at: peep['created_at'],
        peep_time: peep_time(peep['created_at']),
        user_id: peep['user_id'],
        username: peep['username']
        )
    end
  end

  def self.peep_time(timestamp)
    time_values = timestamp.split(/[.\s:-]/)
    time_values.map! { |value| value.to_i }
    timezone = timestamp.chars.last(3).join + ':00'

    Time.new(time_values[0],
      time_values[1],
      time_values[2],
      time_values[3],
      time_values[4],
      time_values[5],
      timezone)
  end

  def formatted_peep_time
    @peep_time.strftime("%I:%M%p %d/%m/%Y")
  end
end
