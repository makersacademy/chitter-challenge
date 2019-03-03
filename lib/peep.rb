require 'pg'
require_relative 'database_connection'

class Peep

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY posted_time DESC;")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'],
        text: peep['text'],
        posted_time: peep['posted_time'],
        user_id: peep['user_id']
      )
    end
  end

  def self.create(text:, posted_time:, user_id:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, posted_time, user_id) VALUES('#{text}', '#{posted_time}', '#{user_id}') RETURNING id, text, posted_time, user_id;")
    Peep.new(
      id: result[0]['id'],
      text: result[0]['text'],
      posted_time: result[0]['posted_time'],
      user_id: result[0]['user_id']
    )
  end

  attr_reader :id, :text, :posted_time, :user_id

  def initialize(id:, text:, posted_time:, user_id:)
    @id = id
    @text = text
    @posted_time = posted_time
    @user_id = user_id
  end

end
