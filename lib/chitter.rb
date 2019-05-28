require 'pg'

class Chitter

  attr_reader :id, :peep, :date_time

  def initialize(id:, peep:, date_time:) 
    @id = id
    @peep = peep
    @date_time = date_time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    chitter_feed = con.exec "SELECT * FROM chitter ORDER BY id DESC;"
    chitter_feed.map do |feed| 
      Chitter.new(id: feed['id'], peep: feed['peep'], date_time: feed['date_time'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    date = Time.now.strftime("%d/%m/%Y %H:%M")
    result = con.exec("INSERT INTO chitter(peep, date_time) VALUES('#{message}', '#{date}' ) RETURNING id, peep, date_time;")
    Chitter.new(id: result[0]['id'], peep: result[0]['peep'], date_time: result[0]['date_time'])
  end

  def self.sign_up(email:, password:, name:, username:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    con.exec("INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}' );")
  end

end 