require 'date'

class Peep
  attr_reader :id, :time, :body, :author
  def initialize(id:, time:, body:, author:)
    @id = id
    @time = time
    @body = body
    @author = author
  end

  def self.create(body:, user_id:)
    results = DatabaseConnection.query("INSERT INTO peeps (body, user_id) VALUES ('#{body}', '#{user_id}') RETURNING id, body, datetimeposted, user_id;")
    author = DatabaseConnection.query("SELECT username FROM users WHERE id='#{results[0]['user_id']}';")[0]['username']

    Peep.new(id: results[0]['id'], time: DateTime.parse(results[0]['datetimeposted']), body: results[0]['body'], author: author)
  end

  def self.find(id)
    results = DatabaseConnection.query("SELECT * FROM peeps WHERE id = '#{id}'")
    author = DatabaseConnection.query("SELECT username FROM users WHERE id='#{results[0]['user_id']}';")[0]['username']

    Peep.new(id: results[0]['id'], time: DateTime.parse(results[0]['datetimeposted']), body: results[0]['body'], author: author)
  end
end