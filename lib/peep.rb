require 'pg'
require './lib/database_connection'
class Peep
  attr_reader :id, :text, :user_name, :handle, :time_posted

  def initialize(id:, text:, user_name:, handle:, time_posted:)
    @id = id
    @text = text
    @user_name = user_name
    @handle = handle
    @time_posted = time_posted
  end

  def self.create(text:, user_name:, handle:, time_posted:)
    result = DatabaseConnection.query("INSERT INTO peeps(text, user_name, handle, time_posted) VALUES($1, $2, $3, $4) RETURNING id, text, user_name, handle;", [text, user_name, handle, time_posted])
    Peep.new(id: result[0]['id'], text: result[0]['text'], user_name: result[0]['user_name'], handle: result[0]['handle'], time_posted: result[0]['time_posted'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], user_name: peep['user_name'], handle: peep['handle'], time_posted: peep['time_posted'])
    end
  end
end
