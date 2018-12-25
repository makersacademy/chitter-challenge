require 'pg'
require_relative 'database_connection'

class Peeps

  attr_reader :message_id, :message_created, :message, :username, :subject

  def initialize(message_id, message_created, message, username, subject)
    @message_id = message_id
    @message_created = message_created
    @message = message
    @username = username
    @subject = subject
  end

  def self.read(val = "ascending")
    result = Peeps.sort(val)
    result.map do |peep|
      Peeps.new(peep['id'], peep['created'],
                peep['message'], peep['username'],
                peep['subject'])
    end
  end

  def self.create(message, username)
    sql = "INSERT INTO peeps (message, username) VALUES ('#{message}', '#{username}') RETURNING *;"
    result = DatabaseConnection.query(sql)
    Peeps.new(result[0]['id'],
              result[0]['created'],
              result[0]['message'],
              result[0]['username'],
              result[0]['subject'])
  end

  def self.sort(val)
    if val == "descending"
      result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created DESC;")
    else
      result = DatabaseConnection.query("SELECT * FROM peeps;")
    end
    result
  end

end
