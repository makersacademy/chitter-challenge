require 'pg'
require_relative 'database_connection'


class Peeps
  def self.create(content)
    DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}') RETURNING content;")
  end
end

=begin
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] }
  end
=end

