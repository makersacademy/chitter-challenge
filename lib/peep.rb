require_relative 'database_connection'
DatabaseConnection.setup('chitter')
class Peep
  attr_reader :id, :content, :user_id, :time
  def initialize(id, content, user_id, time)
    @id = id
    @content = content
    @user_id = user_id
    @time = time
  end

  def self.list
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['id'], peep['content'], peep['user_id'], peep['time']) }
  end

  def self.add(peep, user_id)
    result = DatabaseConnection.query("INSERT INTO peeps(content, user_id, time) VALUES('#{peep[:content]}', '#{user_id}', '#{Time.new.strftime("%H:%M:%S")}') RETURNING id, content, user_id, time")
    Peep.new(result.first['id'], result.first['content'], result.first['user_id'], result.first['time'])
  end
end
