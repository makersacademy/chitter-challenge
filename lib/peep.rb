require 'pg'
require 'date'

class Peep

  def self.all
    con = connect_to_database
    result = con.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(peep['username'], peep['peep'], peep['time'])
    end.reverse
  end

  def self.create(peep, username)
    time = Time.now
    con = connect_to_database
    con.exec("INSERT INTO peeps (peep, time, username)
      VALUES('#{peep}', '#{time}', '#{username}')")
  end

  attr_reader :username, :peep, :time

  def initialize(username, peep, time)
    @username = username
    @peep = peep
    @time = time
  end

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

end
