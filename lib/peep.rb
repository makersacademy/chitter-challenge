require 'date'

class Peep
  def self.establish_connection
    DatabaseConnection.setup('chitter_database')
    DatabaseConnection.setup('chitter_database_test') if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.connection
  end

  def self.post_peep(peep_body)
    DatabaseConnection.query("INSERT INTO peeps (peep_text, date_posted, time_posted, student_id)
                                  VALUES ('This is my first peep!', '#{}')")
  end

end