require 'date'
require_relative 'users'
require_relative 'messages'
require_relative 'database_connection'

class Chitter

  def self.create_user(email, password, name, username)
    return false unless user_unique?(email, username)

    result = DatabaseConnection.query("INSERT INTO users
      (email, password, name, username)
      VALUES ('#{email}', '#{password}', '#{name}', '#{username}')
      RETURNING id ")
    Users.create(
      result[0]['id'],
      email,
      password,
      name,
      username)
  end

  def self.user_unique?(email, username)
    result = DatabaseConnection.query(
      "SELECT * FROM users WHERE email = '#{email}' OR username = '#{username}';")
    result.ntuples.zero?
  end

  def self.user_log_in(email, password)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}';")
    return false if result.ntuples.zero?

    return false if password != result[0]['password']

    Users.create(
      result[0]['id'],
      email,
      password,
      result[0]['name'],
      result[0]['username'])
  end

  def self.create_message(message_text, user)
    message_time = DateTime.now
    result = DatabaseConnection.query("INSERT INTO messages
      (message_text, message_time, user_id)
      VALUES ('#{message_text}', '#{message_time.strftime}', '#{user.id}')
      RETURNING id ")

    @message = Messages.create(
      result[0]['id'],
      message_text,
      message_time.strftime("%m/%d/%Y at %I:%M%p"),
      user.id,
      user.name)
  end

  def self.show_all_messages
    result = DatabaseConnection.query("SELECT * FROM messages ORDER BY message_time DESC;")
    result.map do |message|
      user = DatabaseConnection.query("SELECT name FROM users WHERE id = #{message['user_id']};")
      Messages.new(
        id: message['id'],
        text: message['message_text'],
        time: message['message_time'],
        user_id: message['user_id'],
        user: user[0]['name'])
    end
  end
end
