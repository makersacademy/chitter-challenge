require 'pg'

class Messages

  attr_reader :id, :content, :created_at, :name

  def initialize(id, content, created_at, name)
    @id = id
    @content = content
    @created_at = created_at
    @name = name
  end

  def self.add(content, name)
    database_connection.exec("INSERT INTO messages(content,name) VALUES('#{content}','#{name}')")
  end

  def self.show
    retrieve_data.map { | message | Messages.new(message['id'], message['content'], message['created_at'], message['name']) }
  end

  def self.delete(id)
    database_connection.exec("DELETE FROM messages WHERE id = #{id}")
  end

  private_class_method

  def self.retrieve_data
    database_connection.exec("SELECT * FROM messages ORDER BY id DESC")
  end

  def self.database_connection
    in_test ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end

  def self.in_test
    ENV['RACK_ENV'] == 'test'
  end

end
