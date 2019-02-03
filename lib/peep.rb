require 'pg'
require 'date'
require_relative 'db_connection'
require_relative 'db_setup'

# Models a Peep, a message posted on Chitter
class Peep

  def self.all
    query = DatabaseConnection.query("
      SELECT * FROM peeps ORDER BY created DESC")
    @peeps = query.map { |eachquery|
      Peep.new(
      eachquery['message'],
      eachquery['created'],
      eachquery['userid'])
    }
  end

  def self.username(id)
    query = DatabaseConnection.query("SELECT username FROM users
    WHERE id = '#{id}'")
    query[0]['username']
  end

  def self.add(peep, user_id)
    time = Time.now.strftime("%d/%m/%Y at %H:%M:%S ")
    DatabaseConnection.query("INSERT INTO peeps (message, created, userID)
    VALUES('#{peep}', 'posted on #{time}', '#{user_id}')")
  end

  def self.follow(username)
    query = DatabaseConnection.query("
    INSERT INTO users (followers) VALUES username")
  end



  attr_reader :message, :created, :user_id

  def initialize(message, created, user_id)
    @message = message
    @created = created
    @user_id = user_id
  end

end
