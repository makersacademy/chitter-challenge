
class Replies

  def self.create(peep_id:, message:, user_id:)
    result = DatabaseConnection.query("INSERT INTO replies (peep_id, message, user_id, date_time) VALUES(#{peep_id}, '#{message}', #{user_id}, '#{Time.now.strftime("%d/%m/%Y %H:%M")}') RETURNING id, peep_id, message, user_id, date_time;")
    Replies.new(id: result[0]['id'], peep_id: result[0]['peep_id'], message: result[0]['message'], user_id: result[0]['user_id'], date_time: result[0]['date_time'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM replies WHERE id = #{id}")
  end

  def self.find(peep_id:)
    result = DatabaseConnection.query("SELECT * FROM replies WHERE peep_id = '#{peep_id}';")
    return false unless result.any?
    result.map do |reply|
      Replies.new(id: reply['id'], peep_id: reply['peep_id'], message: reply['message'], user_id: reply['user_id'], date_time: reply['date_time'])
    end
  end

  attr_reader :id, :peep_id, :message, :user_id, :date_time

  def initialize(id:, peep_id:, message:, date_time:, user_id:)
    @id = id
    @peep_id = peep_id
    @message = message
    @date_time = date_time
    @user_id = user_id
  end

  def username(user_class = User)
    @user = user_class.find(id: user_id)
    return @user.username
  end

  def name(user_class = User)
    @user = user_class.find(id: user_id)
    return @user.name
  end

end
