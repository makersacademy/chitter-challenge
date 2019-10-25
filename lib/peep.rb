require_relative 'database_connection'
require_relative 'user'
class Peep
  # attr_reader :id, :message, :username
  #
  # def initialize(id:, user_id:, message:, username:, name:, time:)
  #   @id = id
  #   @user_id = user_id
  #   @message = message
  #   @username = username
  #   @name = name
  #   @time = time
  # end

  def self.user_exists(username)
    users = DatabaseConnection.query("SELECT username FROM tblusers")
    users.each do |user|
      if user['username'] == username
        return true
      end
    end
    return false
  end

  def self.create(message:, username:)
    if Peep.user_exists(username)
      user = DatabaseConnection.query("SELECT user_id, name FROM tblusers WHERE username = '#{username}'")
      result = DatabaseConnection.query("INSERT INTO tblchitters (user_id, username, name, chitter, time) VALUES('#{user[0]['user_id']}', '#{username}', '#{user[0]['name']}', '#{message}', CURRENT_TIMESTAMP)")
      return true
    end
    return false
  end

  def self.all
    output = ""
    result = DatabaseConnection.query("SELECT chitter, username, time FROM tblchitters")
    result.each do |peep|
      # Peep.new(id: peep['chitter_id'], user_id: peep['user_id'], message: peep['chitter'], username: peep['username'], name: peep['name'], time: peep['time'])
      output += "#{peep['username']} peeped: #{peep['chitter']} at #{peep['time']}<br>"
    end
    return output
  end
end
