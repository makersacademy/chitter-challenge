require_relative 'peep'

class Chitter

  def self.create(username, content)
    connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}'").first
    insertion = connection.exec("INSERT INTO peeps (user_id, posted_time, content) VALUES(#{result['id']}, current_timestamp, '#{content}') RETURNING id, user_id, posted_time, content").first
    Peep.new(insertion['id'], username, insertion['posted_time'], insertion['content'])
  end

  def self.list
    connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
    result = connection.exec("SELECT * FROM peeps LEFT JOIN users ON peeps.user_id = users.id ")
    result.map { |row| Peep.new(row['id'], row['username'], row['posted_time'], row['content']) }
  end

end
