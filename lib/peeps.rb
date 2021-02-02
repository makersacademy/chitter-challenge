require 'pg'
require_relative 'database_connection'

class Peeps
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup(dbname: 'chitter_test')
  else
    DatabaseConnection.setup(dbname: 'chitter')
  end
  
  def self.create(content)
    DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}') RETURNING content;")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] }
  end
end

