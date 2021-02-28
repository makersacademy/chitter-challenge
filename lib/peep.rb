require 'pg'

class Peep
  attr_reader :id, :peep, :username, :time, :date

  def initialize(id, peep , username, time, date)
    @id = id
    @peep = peep
    @username = username
    @time = time
    @date
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    p "self.all method"
    result = connection.exec("SELECT * FROM peeps ;")
    p result
    result.map do |peep_entry|
      p peep_entry
      Peep.new(peep_entry['id'], peep_entry['peep'], peep_entry['username'], peep_entry['time'], peep_entry['date'])
    end
    end

  def self.add_new(peep, username)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    time, date = Time.new.to_s.slice(11,8), Time.new.to_s.slice(0,10)
    result = connection.exec("INSERT INTO peeps (peep, username, time, date) VALUES ('#{peep}', '#{username}', '#{time}', '#{date}') RETURNING id ,peep, user, time; ")
    p "result of the sql add query"
    p result
    Peep.new(result[0]['id'], result[0]['peep'], result[0]['username'], result[0]['time'], result[0]['date'])

  end


end
