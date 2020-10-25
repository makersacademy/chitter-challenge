require_relative './database_connection'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        message_content: peep['message_content'],
        maker_id: peep['maker_id']
      )
    end
  end

  def self.create(message_content:, maker_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (message_content, maker_id) VALUES ('#{message_content}', '#{maker_id}') RETURNING id, message_content, maker_id;")

    Peep.new(
      id: result[0]['id'],
      message_content: result[0]['message_content'],
      maker_id: result[0]['maker_id']
    )
  end

  attr_reader :id, :message_content, :maker_id

  def initialize(id:, message_content:, maker_id:)
    @id = id
    @message_content = message_content
    @maker_id = maker_id
  end

end
