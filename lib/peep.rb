require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :posted, :username

  def initialize(id:, content:, username:, posted: Time.now.strftime("%I:%M %p, %d/%m/%Y"))
    @id = id
    @content = content
    @posted = posted
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    array_of_peeps = result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], 
               posted: peep['posted'], username: peep['username'])
    end
    array_of_peeps.reverse
  end

  def self.create(content:, username:)
    posted = Time.now.strftime("%I:%M %p, %d/%m/%Y")
    result = DatabaseConnection.query("INSERT INTO peeps (content, posted, username) 
                                      VALUES($1, $2, $3) RETURNING id, content, posted, username;", 
                                      [content, posted, username])
    Peep.new(id: result[0]['id'], content: result[0]['content'], 
             posted: result[0]['posted'], username: result[0]['username'])
  end
end
