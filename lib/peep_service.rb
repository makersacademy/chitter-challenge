require 'pg'
require_relative './database_connection'
require_relative './peep'

class PeepService

  def self.post(message, username)
    DatabaseConnection.query("INSERT INTO peeps (message, username, created_at) VALUES ('#{message}', '#{username}', '#{PeepService.current_timestamp}');")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(peep['id'], peep['message'], peep['username'], peep['created_at']) }
  end

  private

  def self.current_timestamp
    Time.now
  end
end