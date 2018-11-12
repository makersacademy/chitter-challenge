require 'pg'

class Peep

  attr_reader :id, :text, :created_at

  def initialize(id:, text:, created_at:)
    @id = id
    @text = text
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query(
      "SELECT * 
       FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep["id"], 
        text: peep["text"], 
        created_at: peep["created_at"])
    end.reverse
  end

  def self.create(text:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (text) 
       VALUES ('#{text}') 
       RETURNING id, text, created_at;")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      created_at: result[0]['created_at'])
  end

  def self.delete(id:)
    DatabaseConnection.query(
      "DELETE FROM peeps 
       WHERE id = #{id}")
  end

  def self.update(id:, text:)
    result = DatabaseConnection.query(
      "UPDATE peeps 
       SET text='#{text}' 
       WHERE id='#{id}' 
       RETURNING id, text;")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      created_at: result[0]['created_at'])
  end

  def self.find(id:)
    result = DatabaseConnection.query(
      "SELECT * 
       FROM peeps 
       WHERE id = #{id};")
    Peep.new(
      id: result[0]['id'], 
      text: result[0]['text'], 
      created_at: result[0]['created_at'])
  end
end
