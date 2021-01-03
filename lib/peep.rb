require_relative './database_connection.rb'

class Peep

  def initialize(peep, user = 'AJ')
    @peep = peep
    @user = user
  end

  def self.post(peep)
    DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES ('#{peep}', '#{Time.now.strftime("%k:%M")}');")
  end

end
