class Peep
  def self.create(message:, time:, user_id:)
    columns = "(message, time, user_id)"
    values = "('#{message}','#{time}','#{user_id}')"
    sql = "INSERT INTO peeps #{columns} VALUES #{values} RETURNING *;"
    result = DatabaseConnection.execute(sql).first

    Peep.new(
      id: result['id'].to_i,
      message: result['message'],
      time: result['time'],
      user_id: result['user_id'].to_i
    )
  end

  def self.all
    sql = "SELECT * FROM peeps;"
    result = DatabaseConnection.execute(sql)
    result.each.map do |peep|
      Peep.new(
        id: peep['id'].to_i,
        message: peep['message'],
        time: peep['time'],
        user_id: peep['user_id'].to_i
      )
    end
  end

  attr_reader :id, :message, :time, :user_id

  def initialize(id:, message:, time:, user_id:)
    @id = id
    @message = message
    @time = time
    @user_id = user_id
  end
end
