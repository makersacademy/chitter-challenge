require 'pg'

def truncates
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE message;')
  #connection.exec('TRUNCATE TABLE user;')
end

# def persisted_data(id:)
#   connection = PG.connect(dbname: 'bookmark_manager_test')
#   result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
#   result.first
# end


def add_tweet
  Chitter.add(tweet: "testing", username: 'testuser', created_at: Time.now)
  
end

def add_user
  User.add(username: 'testuser', name: 'testname', email: 'test@test.com', password: 'test')
end

