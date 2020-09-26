require 'pg'

def truncates
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE TABLE users, peeps')
end

def add_test_users
  connection = PG.connect(dbname: 'chitter_test')
  # add ruby code for adding users
end

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.query("SELECT * FROM #{table} WHERE id = #{id};")
  result.first
end

=begin
def add_urls
  Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
  Bookmark.create('Destroy All Software', 'http://www.destroyallsoftware.com')
  Bookmark.create('Google', 'http://www.google.com')
end

def add_url
  Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
end
=end
