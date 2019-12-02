# Code needed to run the web app, orgnaised into Classes and Methods
require './db/database_connection.rb'
require './db/access_database.rb'

class Peep
  attr_reader :username, :post

  def create(username, post)
    @username = username
    @post = post.to_s
    "Post created"
  end

  def is_user?(username)
    DatabaseConnection.setup('chitter')

    # Returns false if username is not in table
    result = DatabaseConnection.query(
      "SELECT 1 FROM users WHERE username = '#{username}';"
    )
    result.map { |line| line } != []
  end

end
