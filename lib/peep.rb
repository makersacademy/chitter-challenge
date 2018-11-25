require 'pg'
require 'database_connection'

class Peep

  attr_reader :id, :user_name, :time_stamp, :text

  def initialize(id:, user_name:, time_stamp:, text:)
    @id  = id
    @user_name = user_name
    @time_stamp = time_stamp
    @text = text

  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peeps|
      Peep.new(id: peep['id'],
        user_name: peep['user_name'],
        timestamp: peep['time_stamp'],
        text: peep['text'])}
  end

  def self.create(user_name:, time_stamp:, text:)
    result = DatabaseConnection.query("INSERT INTO peeps (user_name, time_stamp, text)
      VALUES('#{user_name}', '#{time_stamp}', '#{text}') RETURNING user_name, time_stamp, text;")
    Peep.new(id: result[0]['id'],
      user_name: result[0]['user_name'],
      time_stamp: result[0]['time_stamp'],
      text: result[0]['text'])
  end

  # def self.find(id:)
  #   result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  #   Bookmark.new(id: result[0]['id'],
  #     title: result[0]['title'],
  #     url: result[0]['url'])
  # end

end
