require_relative 'database_connection'

class Peep
  attr_reader :id, :content, :posted, :username, :name

  def initialize(id:, content:, username:, name:, posted: Time.now.strftime("%I:%M %p, %d/%m/%Y"))
    @id = id
    @content = content
    @posted = posted
    @username = username
    @name = name
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    array_of_peeps = result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], 
               posted: peep['posted'], username: peep['username'], name: peep['name'])
    end
    array_of_peeps.reverse
  end

  def self.create(content:, username:, name:)
    posted = Time.now.strftime("%I:%M %p, %d/%m/%Y")
    result = DatabaseConnection.query("INSERT INTO peeps (content, posted, username, name) 
                                      VALUES($1, $2, $3, $4) RETURNING id, content, posted, username, name;", 
                                      [content, posted, username, name])
    Peep.new(id: result[0]['id'], content: result[0]['content'], 
             posted: result[0]['posted'], username: result[0]['username'], name: result[0]['name'])
  end
end
