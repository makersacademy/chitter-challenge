require './db/database_connection.rb' # Contains database connection methods
require 'date' # Required to use the DateTime function

DatabaseConnection.setup('chitter') # Connect to the chitter database

PEEP_LENGTH = 140

class Peep
  attr_reader :content

  def initialize(id, datetime, username, post)
    @content = { id: id, datetime: datetime, username: username, post: post }
  end

  def self.create(username, post)
    raise "Username not recognised" if is_user?(username) == false
    raise "Too many characters" if post.size > PEEP_LENGTH

    # Insert post into database
    DatabaseConnection.query(
      "INSERT INTO peeps (datetime, username, post) VALUES ('#{datetimenow}', '#{username}', '#{post}');"
    )
    "Post created"
  end

  def self.is_user?(username)
    # Returns false if username is not in table
    result = DatabaseConnection.query(
      "SELECT 1 FROM users WHERE username = '#{username}';"
    )
    result.map { |line| line } != []
  end

  private

  def self.datetimenow
    DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
  end

  # def self.datenow
  #   DateTime.now.strftime("%Y-%m-%d")
  # end

end
