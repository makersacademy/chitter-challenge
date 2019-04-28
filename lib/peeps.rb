require './lib/database_connection'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        content: peep['content'],
        time: peep['title'],
        id: peep['id'],
      )
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content, time) VALUES('#{content}', '#{time}') RETURNING id, time, content;")
    Peep.new(id: result[0]['id'], time: result[0]['time'], content: result[0]['content'])
  end

end
