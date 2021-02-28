require_relative 'database_connection'
require 'time'

class Peep
  def self.create(content:, user:)
    time = (Time.now).strftime('%T')
    result = DatabaseConnection.query("INSERT INTO peeps (content, user_id, time_created) VALUES ($$#{content}$$, #{user.id}, '#{time}') RETURNING id, content, time_created;")
    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      time: result[0]['time_created'],
      user: user
     )
  end

  def self.all
    result = DatabaseConnection.query('SELECT peeps.id, content, user_id, time_created, name, username FROM peeps INNER JOIN users on peeps.user_id = users.id;')

    result.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        time: peep['time_created'],
        user: User.find(peep['user_id'])
      )
    end
  end

  attr_reader :id, :content, :time, :user

  def initialize(id:, content:, time:, user:)
    @id = id
    @content = content
    @time = time
    @user = user
  end
end
