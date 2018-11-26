require 'pg'
require_relative './database_connection'

class Peep

  attr_reader :id, :content, :username, :date

  def initialize(id:, content:, username:, date:)
    @id = id
    @content = content
    @username = username
    @date = date
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY ID DESC;')
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], username: peep['username'], date: peep['date'])
    end
  end

  def self.create(username:, content:, date:)
    result = DatabaseConnection.query("INSERT INTO peeps (content, username, date) VALUES('#{content}', '#{username}','#{date}') RETURNING id, content, username, date")
    Peep.new(id: result[0]['id'], content: result[0]['content'], username: result[0]['username'], date: result[0]['date'])
  end

end
