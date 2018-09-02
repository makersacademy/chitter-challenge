require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
       Peep.new(peep["id"], peep["text"], peep["created_at"])
     end.reverse
  end

  def self.create(text)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{text}') RETURNING id, text;")
    Peep.new(result[0]['id'], result[0]['text'], result[0]['created_at'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
  end

  def self.update(id, text)
    result = DatabaseConnection.query("UPDATE peeps SET text='#{text}' WHERE id='#{id}' RETURNING id, text;")
    Peep.new(result[0]['id'], result[0]['text'], result[0]['created_at'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
    Peep.new(result[0]['id'], result[0]['text'], result[0]['created_at'])
  end


  attr_reader :id, :text, :created_at

  def initialize(id, text, created_at)
    @id = id
    @text = text
    @created_at = created_at
  end

end
