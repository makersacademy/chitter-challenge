require 'pg'
require_relative './database_connection'
require_relative './peep'

class PeepService

  def self.post(message, author_id)
    # TODO: validate that author is a valid user
    DatabaseConnection.query("INSERT INTO peeps (message, author_id, created_at) VALUES ('#{message}', #{author_id}, '#{PeepService.current_timestamp}');")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(peep['id'], peep['message'], peep['author_id'], peep['created_at']) }
  end

  private

  def self.current_timestamp
    Time.now
  end
end