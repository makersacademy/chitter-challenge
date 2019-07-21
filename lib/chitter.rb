require_relative './user'
require_relative './peep'
require_relative './database_connection'

class Chitter

  def self.create(body)
    time = Time.now
    DatabaseConnection.query("INSERT INTO peeps (body, time, author) VALUES('#{body.gsub!(/[',]/, "'" => "''")}', '#{time}', #{@current_user.id});")
  end

  def self.list
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    # creates an array of hashes where each hash is a peep.
    # want to store each hash as an instance of the Peep class
    # within an array. By storing the author of the peep as an
    # instance of the User class we can access their attributes
    # later if we need.

    result.map do |peep|
      author = User.find_user(peep['author'])
      Peep.new(author, peep['body'], peep['time'])
    end

  end

  def self.log_in(email, password)
    @current_user = User.log_in(email, password)
  end

  def self.user
    @current_user
  end

  def self.log_out
    @current_user = nil
  end

  def check_if_logged_in
    prompt_user_to_log_in if @current_user.nil?
  end

  def prompt_user_to_log_in
    "Please log in to post a peep"
  end

  def self.reset_yoself
    DatabaseConnection.query("TRUNCATE peeps, users;")
  end
end
