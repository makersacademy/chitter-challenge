class Chitter

  def self.create(username, content)
    connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
    # find user_id from username
    result = connection.exec("SELECT * FROM users WHERE username = '#{username}'")
    # p result.first
    insertion = connection.exec("INSERT INTO peeps (user_id, posted_time, content) VALUES('#{result.first['id']}', current_timestamp, '#{content}') RETURNING id, user_id, posted_time, content")
    #Peep.new
  end

end
