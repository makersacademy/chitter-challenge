require_relative './database_connection'

class Message

  attr_reader :comment, :id, :creation

  def initialize(comment:, id:, creation:)
    @comment = comment
    @id = id
    @creation = creation
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")

    result.map do |message| 
      Message.new(comment: message['comment'], id: message['id'], creation: message['creation'])
    end
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO messages (comment, creation) VALUES($1, $2) RETURNING comment, id, creation;",
      [message, Time.new]
    )

    Message.new(comment: result[0]['comment'], id: result[0]['id'], creation: result[0]['creation'])
  end

end
