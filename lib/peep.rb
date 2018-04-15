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
  end

  def self.add(peep, user)
    result = DatabaseConnection.query("INSERT INTO peeps(content, user_id, time) VALUES('#{peep[:content]}', '#{user.id}', '#{Time.new.strftime("%H:%M:%S")}') RETURNING id, content, user_id, time")
    Peep.new(result.first['id'], result.first['content'], result.first['user_id'], result.first['time'])
  end

end
class QuickTest
def id
  0
end
end
user = QuickTest.new
p user.id
test_peep = Peep.add({:content => "blach"}, user)
p test_peep
p test_peep.id
p test_peep.content
p test_peep.user_id
p test_peep.time
