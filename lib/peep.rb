require 'pg'
require 'time'

class Peep
  def self.all
    connection = DataBase.new.connection
    result = connection.exec("SELECT * FROM peeps;")
    result2 = result.map do |peep|
      Peep.new(content: peep['content'], 
        name: peep['name'], 
        username: peep['username'], 
        id: peep['id'], 
        time: peep['time'])
    end
    result2.sort_by { |peep| -Time.parse(peep.time).to_i }
  end

  def self.create(content:, username:, name:)
    connection = DataBase.new.connection
    result = connection.exec <<~SQL
      INSERT INTO peeps (name, username, content, time) 
      VALUES ('#{name}', '#{username}', '#{content}', '#{Time.now.getutc}') RETURNING id, username, name, content, time;
    SQL
    Peep.new(id: result[0]['id'], 
      content: result[0]['content'], 
      name: result[0]['name'], 
      username: result[0]['username'], time: result[0]['time'])
  end

  def initialize(content:, name:, id:, username:, time:)
    @content = content
    @name = name
    @id = id
    @username = username
    @time = time
  end

  attr_reader :content, :name, :id, :username, :time
end
