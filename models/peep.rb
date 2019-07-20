require 'pg'
require_relative 'database_connection'
require './spec/database_connection_setup'

class Peep

  attr_reader :time, :peep, :username

  def initialize(peep = nil, time = nil, username = nil)
    @peep = peep
    @time = time
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(peep['peep'], peep['time'], peep['username']) }
    # implement a sort_by(time) method instead of reversing the array
  end

  def self.add(peep, username, time = Time.now)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, username, time) VALUES('#{peep}', '#{username}', '#{time}') RETURNING peep, username, time;")
    Peep.new(result[0]['peep'], result[0]['username'], result[0]['time'])
    # RETURNING id, title, url
  end

# if ENV['ENVIRONMENT'] == 'test'
# connection = PG.connect(dbname: 'peep_manager_test')
# else 
# connection = PG.connect(dbname: 'peep_manager')
# end

end
