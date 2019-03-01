require 'pg'

class Peep
  attr_accessor :id, :username, :content, :timestamp
  def initialize(id:, username:, content:, timestamp:)
    @id = id
    @username = username
    @content = content
    @timestamp = timestamp
  end

  def self.connection
    ENV['ENVIRONMENT'] == 'test' ? @conn = PG.connect(dbname: 'chitter_test') : @conn = PG.connect(dbname: 'chitter')
  end

  def self.add(user_id:, content:)
    connection
    @conn.exec("INSERT INTO peeps (id, peep_content, timestamp, user_id) VALUES(DEFAULT, '#{content}', '#{Time.now}', '#{user_id}')")
  end

  def self.all
    connection
    peeps = []
    @conn.exec("SELECT * FROM peeps LEFT OUTER JOIN users ON peeps.user_id = users.id ORDER BY timestamp desc") do |result|
      result.each do |row|
        peeps << Peep.new(id: row["id"], username: row["username"], content: row["peep_content"], timestamp: row["timestamp"])
      end
    end
    peeps
  end
end
