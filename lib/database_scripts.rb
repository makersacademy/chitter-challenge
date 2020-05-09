require 'pg'
require_relative './person'
require_relative './peep'

def add_person(user_name, real_name, email, password)
  ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
  connection = PG.connect :dbname => db
  response1 = connection.exec "SELECT * FROM users WHERE user_handle = '#{user_name}'"
  response2 = connection.exec "SELECT * FROM users WHERE email = '#{email}'"
  if response1.count.zero? && response2.count.zero?
    connection.exec "INSERT INTO users (email, real_name, user_handle, password) VALUES ('#{email}','#{real_name}','#{user_name}','#{password}')"
    get_person(user_name, password)
  else
    nil
  end
end

def get_person(username, password)
  ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
  connection = PG.connect :dbname => db
  response = connection.exec "SELECT id, real_name, user_handle, email, password FROM users WHERE user_handle = '#{username}'"
  if response.count.positive? && response[0]['password'] == password
    person = Person.new(response[0]['id'], username, response[0]['real_name'], response[0]['email'], password)
    peeps = connection.exec "SELECT * FROM peeps WHERE user_handle = '#{username}'"
    peeps.each do |peep| 
      person.add(Peep.new(peep['id'], peep['user_handle'], peep['real_name'], time_since(peep['timestamp']), peep['body']))
    end
    return person
  else
    nil
  end
end

def addpeep(body, user, real)
  ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
  connection = PG.connect :dbname => db
  timestamp = Time.new
  connection.exec "INSERT INTO peeps (timestamp, body, user_handle, real_name) VALUES ('#{timestamp}','#{body}','#{user}','#{real}')"
end

def getpeeps
  ENV['ENVIRONMENT'] == 'test' ? db = 'chitter_test' : db = 'chitter'
  connection = PG.connect :dbname => db
  response = connection.exec "SELECT * FROM peeps"
  response.map do |peep|
    Peep.new(peep['id'], peep['user_handle'], peep['real_name'], time_since(peep['timestamp']), peep['body'])
  end
end

def time_since(timestamp)
  time_diff = ((Time.now - Time.parse(timestamp)) / 60).to_i
  time_diff == 1 ? s = "" : s = "s"
  "Posted #{time_diff} minute#{s} ago."
end
