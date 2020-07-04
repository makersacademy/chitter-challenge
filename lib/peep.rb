require_relative "database_connection"
require "uri"

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(text: peep["text"], name: peep["name"], id: peep["id"])
    end
    end

  def self.create(text:, name:)
    # return true unless empty?
    result = DatabaseConnection.query("INSERT INTO peeps (text, name) VALUES('#{text}', '#{name}') RETURNING id, name, text;")
    Peep.new(id: result[0]["id"], name: result[0]["name"], text: result[0]["text"])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
  end

  def self.update(id:, text:, name:)
    result = DatabaseConnection.query("UPDATE peeps SET text = '#{text}', name = '#{name}' WHERE id = #{id} RETURNING id, text, name;")
    Peep.new(id: result[0]['id'], name: name[0]['name'], text: result[0]['text'])
  end
  
  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}")
    Peep.new(id: result[0]['id'], name: result[0]['name'], text: result[0]['text'])
  end
  
  attr_reader :id, :name, :text

  def initialize(id:, name:, text:)
    @id = id
    @name = name
    @text = text
  end

  # private

  # def self.empty?
  # end

end
