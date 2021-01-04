require 'pg'
require 'uri'
require_relative 'database_connection'


class Peep
  attr_reader :id, :fullname, :username, :content, :created_at

  def initialize(id:, fullname:, username:, content:, created_at:)
      @id = id
      @fullname = fullname
      @username = username
      @content = content
      @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        fullname: peep['fullname'],
        username: peep['username'],
        content: peep['content'],
        created_at: peep['created_at']
      )
    end
  end

  def self.create(fullname:, username:, content:)
    result = DatabaseConnection.query("INSERT INTO peeps(fullname, username, content) VALUES ('#{fullname}','#{username}','#{content}') RETURNING id, fullname, username, content, created_at;")
    Peep.new(
      id: result[0]['id'],
      fullname: result[0]['fullname'],
      username: result[0]['username'],
      content: result[0]['content'],
      created_at: result[0]['created_at']
    )
  end
end
