require_relative 'database_connection'
require 'time'

class Peep
  def self.create(content:, user_id:)
    time = (Time.now).strftime('%T')
    result = DatabaseConnection.query("INSERT INTO peeps (content, user_id, time_created) VALUES ($$#{content}$$, #{user_id}, '#{time}') RETURNING id, content, time_created;")
    names = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user_id}")
    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      time: result[0]['time_created'],
      username: names[0]['username'],
      name: names[0]['name']
     )
  end

  def self.all
    result = DatabaseConnection.query('SELECT peeps.id, content, user_id, time_created, name, username FROM peeps INNER JOIN users on peeps.user_id = users.id;')

    result.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        time: peep['time_created'],
        username: peep['username'],
        name: peep['name']
      )
    end
  end

  attr_reader :id, :content, :time, :username, :name

  def initialize(id:, content:, time:, username:, name:)
    @id = id
    @content = content
    @time = time
    @username = username
    @name = name
  end
end
