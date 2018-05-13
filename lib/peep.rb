require 'pg'
require_relative './database_connection'
require 'user'

class Peep

  attr_reader :id, :text, :user_id, :time

  def initialize(id:, text:, user_id:, time:)
    @id = id.to_i
    @text = text
    @user_id = user_id.to_i
    @time = time
  end

  def self.create(text:, user_id:, time:)
    result = DatabaseConnection.query("INSERT INTO peeps (text, user_id, time)
    VALUES('#{text}', '#{user_id}', current_timestamp(0)) RETURNING id, text, user_id, time;")
      Peep.new(id: result[0]['id'], text: result[0]['text'], user_id: result[0]['user_id'], time: result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text'], user_id: peep['user_id'], time: peep['time'])}
  end

end
