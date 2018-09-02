require 'pg'

class Peep

  attr_reader :peep, :time, :user_id

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end

    result = con.exec('SELECT * FROM peeps ORDER BY id DESC')

    result.map { |peep|
      Peep.new(peep['peep'], peep['time'], peep['user_id'])
    }
  end

  def self.create(peep, user_id)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    time = Time.new
    result = con.exec("INSERT INTO peeps (peep, time, user_id) 
      VALUES ('#{peep}', '#{time}', '#{user_id}') 
      RETURNING peep, time, user_id;")
    Peep.new(result[0]['peep'], result[0]['time'], result[0]['user_id'])
  end

  def initialize(peep, time, user_id)
    @peep = peep
    @time = time
    @user_id = user_id
  end

  def users(user_id)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("SELECT * FROM users WHERE id = '#{user_id}';")
  end
end
