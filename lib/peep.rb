require 'pg'
require_relative './database_connection'

class Peep
  def self.all
    connect_db
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map { |row| { peep: row['peep'], post_time: row['post_time'] } }.reverse
  end

  def self.post(peep:)
    connect_db
    time = Time.now.strftime("%D at %H:%M:%S")
    DatabaseConnection.query("INSERT INTO peeps (peep, post_time) VALUES('#{peep}', '#{time}');")
  end

  private

  def self.connect_db
    if ENV['RACK_ENV'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
  end
end
