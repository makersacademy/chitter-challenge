require './db/database_connection.rb'
require './db/access_database.rb'
require 'date' # Required to use the DateTime function

DatabaseConnection.setup('chitter') # Connect to the chitter database

class Peep
  attr_reader :username, :post

  def create(username, post)
    raise "Username not recognised" if is_user?(username) == false

    # Get current date and time
    datenow = DateTime.now.strftime("%Y-%m-%d")
    timenow = DateTime.now.strftime("%H:%M:%S")
    DatabaseConnection.query(
      "INSERT INTO peeps (date, time, username, post) VALUES ('#{datenow}', '#{timenow}', '#{username}', '#{post}');"
    )

    @username = username
    @post = post.to_s
    "Post created"
  end

  def is_user?(username)

    # Returns false if username is not in table
    result = DatabaseConnection.query(
      "SELECT 1 FROM users WHERE username = '#{username}';"
    )
    result.map { |line| line } != []
  end

end
