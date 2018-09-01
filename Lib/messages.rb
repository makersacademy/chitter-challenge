require 'pg'

class Messages

  attr_reader :id, :content, :created_at

  def initialize(id, content, created_at)
    @id = id
    @content = content
    @created_at = created_at
  end

  def self.add(content)
    database_connection.exec( "INSERT INTO messages(content) VALUES('#{content}')" )
  end

  def self.show
    retrieve_data.map { | message | Messages.new(message['id'], message['content'], message['created_at']) }
  end

  def self.delete(id)
    database_connection.exec( "DELETE FROM messages WHERE id = #{id}" )
  end

  private

  def self.retrieve_data
    database_connection.exec( "SELECT * FROM messages ORDER BY id DESC" )
  end

  def self.database_connection
    in_test ? PG.connect( dbname: 'chitter_test' ) : PG.connect( dbname: 'chitter' )
  end

  def self.in_test
    ENV['RACK_ENV'] == 'test'
  end

end