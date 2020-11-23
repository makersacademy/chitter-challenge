require 'date'
require_relative './database_connection'
require_relative './user'

class Peep
  def self.establish_connection
    DatabaseConnection.setup('chitter_database')
    DatabaseConnection.setup('chitter_database_test') if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.connection
  end

  def self.post_peep(peep_body:, username:)
    user_id = DatabaseConnection.query("SELECT student_id FROM makers_user WHERE username='#{username}';")
    # p user_id[0]['student_id']
    DatabaseConnection.query("INSERT INTO peeps (peep_text, datetime, student_id) VALUES ('#{peep_body}', CURRENT_TIMESTAMP, '#{user_id[0]['student_id']}');")
  end

  def self.display_peeps
    DatabaseConnection.query("SELECT peep_text, datetime FROM peeps ORDER BY datetime DESC;")
  end

end