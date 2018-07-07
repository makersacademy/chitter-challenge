require './lib/database_connection'

class Blab
  attr_reader :id, :content

  def initialize(id, content)
    @id = id
    @content = content
  end

  def self.all
    result = DatabaseConnection.exec("SELECT * FROM blabs;")
    result.map do |blab|
      Blab.new(blab['id'], blab['content'])
    end
  end

  def self.create(content)
    result = DatabaseConnection.exec("INSERT INTO blabs (content) VALUES ('#{content}') RETURNING id, content;")
    Blab.new(result.first['id'], result.first['content'])
  end

  def ==(blab)
    @id == blab.id
  end
end
