require_relative 'database_connection'

class Peep

  def self.all

    peeps = DatabaseConnection.query("SELECT * FROM chitter;")
    peeps.map do |peep|
      Peep.new(
        username: peep['username'], 
        text: peep['text'],
        id: peep['id'], 
        )
    end
  end

  def self.create(username:, text:)
    result = DatabaseConnection.query("INSERT INTO chitter (username, text) VALUES('#{username}', '#{text}') RETURNING id, username, text;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], text: result[0]['text'])
  end


  attr_reader :id, :username, :text

  def initialize(id:, username:, text:)
    @id = id
    @username = username
    @text = text
  end

end