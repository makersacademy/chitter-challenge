require 'pg'
require './lib/database_connection'
class Peep
  attr_reader :text, :user_name, :handle

  def initialize(text:, user_name:, handle:)
    @text = text
    @user_name = user_name
    @handle = handle
  end

  def self.create(text:, user_name:, handle:)
    result = DatabaseConnection.query("INSERT INTO peeps(text, user_name, handle) VALUES($1, $2, $3) RETURNING text, user_name, handle;", [text, user_name, handle])
    Peep.new(text: result[0]['text'], user_name: result[0]['user_name'], handle: result[0]['handle'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(text: peep['text'], user_name: peep['user_name'], handle: peep['handle'])
    end
  end
end