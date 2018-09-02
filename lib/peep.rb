require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
       Peep.new(peep["id"], peep["text"])
     end
  end

  def self.create(text)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{text}') RETURNING id, text;")
    Peep.new(result[0]['id'], result[0]['text'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
  end

  def self.update(id, text)
    result = DatabaseConnection.query("UPDATE peeps SET text='#{text}' WHERE id='#{id}' RETURNING id, text;")
    Peep.new(result[0]['id'], result[0]['text'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
    Peep.new(result[0]['id'], result[0]['text'])
  end


  attr_reader :id, :text

  def initialize(id, text)
    @id = id
    @text = text
  end

end
