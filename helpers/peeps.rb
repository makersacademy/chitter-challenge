module PeepHelper

def peep_username(id)
  result = DatabaseConnection.query('SELECT * FROM users WHERE id = $1;', [id])
  user = User.new(id: result[0]['id'], username: result[0]['username'], email: result[0]['email'])
  user.username
end

def format_time(time)
  date = DateTime.parse(time) - DateTime.now
  RelativeTime.in_words(DateTime.now - date) 
end

end