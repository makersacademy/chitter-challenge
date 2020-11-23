require 'date'
require 'cgi'

class Peep
  attr_reader :id, :time, :body, :author
  def initialize(id:, time:, body:, author:)
    @id = id
    @time = time
    @body = body
    @author = author
  end

  def self.create(body:, user_id:)
    return false if body.length > 140

    results = DatabaseConnection.query("INSERT INTO peeps (body, user_id) VALUES ('#{CGI.escapeHTML(body)}', '#{user_id}') RETURNING id, body, datetimeposted, user_id;")
    author = DatabaseConnection.query("SELECT username FROM users WHERE id='#{results[0]['user_id']}';")[0]['username']

    Peep.new(id: results[0]['id'], time: DateTime.parse(results[0]['datetimeposted']), body: results[0]['body'], author: author)
  end

  def self.find(peep_id)
    results = DatabaseConnection.query("SELECT * FROM peeps WHERE id = '#{peep_id}'")
    author = DatabaseConnection.query("SELECT username FROM users WHERE id='#{results[0]['user_id']}';")[0]['username']

    Peep.new(id: results[0]['id'], time: DateTime.parse(results[0]['datetimeposted']), body: results[0]['body'], author: author)
  end

  def self.all
    results = DatabaseConnection.query("SELECT * FROM peeps ORDER BY datetimeposted DESC;")
    results.map do |peep|
      author = DatabaseConnection.query("SELECT username FROM users WHERE id='#{peep['user_id']}';")[0]['username']
      Peep.new(id: peep['id'], time: DateTime.parse(peep['datetimeposted']), body: peep['body'], author: author)
    end
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM peeps WHERE id='#{id}';")
    nil
  end

  def total_favourites
    DatabaseConnection.query("SELECT COUNT (DISTINCT user_id) FROM favourites WHERE peep_id = #{id};")[0]['count'].to_i
  end

  def favourited?(user_id)
    !DatabaseConnection.query("SELECT * FROM favourites WHERE user_id = #{user_id} AND peep_id = #{id};").num_tuples.zero?
  end
end
