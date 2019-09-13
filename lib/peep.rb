require_relative 'database_connection'
require_relative 'userpeep'

class Peep

  def initialize(id:, :content, :time)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['title'], time: peep['url'])
    end
  end

  def self.create(content:, user_id:)
    time = Time.now.to_s[0..-7]
    result = Database.query("INSERT INTO peeps (content, time) VALUES ('#{content}', '#{time}' RETURNING id, content, time;")
    newpeep = Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'])
    UserPeep.create(user_id: user_id, peep_id: newpeep.id)
  end
  
end