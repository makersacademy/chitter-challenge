require './db/database_connection.rb' # Contains database connection methods
require 'date' # Required to use the DateTime function

PEEP_LENGTH = 140

# If rspec test is running, connect to test database
# instead of live one:
if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chittertest')
else
  DatabaseConnection.setup('chitter')
end

class Peep
  attr_reader :content

  def initialize(id, datetime, username, post)
    @content = { id: id, datetime: datetime, username: username, post: post }
  end

  def self.create(username, post)
    raise "Username not recognised" if user?(username) == false
    raise "Too many characters" if post.size > PEEP_LENGTH

    # Insert post into database
    DatabaseConnection.query(
      "INSERT INTO peeps (datetime, username, post) VALUES ('#{datetimenow}', '#{username}', '#{post}');"
    )
    "Post created"
  end

  def self.user?(username)
    # Returns false if username is not in table
    result = DatabaseConnection.query(
      "SELECT 1 FROM users WHERE username = '#{username}';"
    )
    result.map { |line| line } != []
  end

  def self.datetimenow
    DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
  end

  def return_date
    Date.parse(content[:datetime]).strftime("%A %d %B %Y")
  end

  def return_time
    DateTime.parse(content[:datetime]).strftime("%H:%M")
  end

end
